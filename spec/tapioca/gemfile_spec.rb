# typed: strict
# frozen_string_literal: true

require "spec_helper"

module Tapioca
  class GemfileSpec < Minitest::HooksSpec
    extend T::Sig

    SUPPORT_GEM_PATH = "spec/support/gems"

    describe("gem can export RBI files") do
      it("can export RBIs") do
        foo_spec = make_spec("foo")
        refute(foo_spec.export_rbi_files?)

        bar_spec = make_spec("bar")
        assert(bar_spec.export_rbi_files?)

        fizz_spec = make_spec("fizz")
        assert(fizz_spec.export_rbi_files?)
      end

      it("lists exported RBIs") do
        foo_spec = make_spec("foo")
        assert_empty(foo_spec.exported_rbi_files)

        bar_spec = make_spec("bar")
        bar_rbis = bar_spec.exported_rbi_files.map { |path| File.basename(path) }
        assert_equal(["first.rbi", "second.rbi"], bar_rbis)

        fizz_spec = make_spec("fizz")
        fizz_rbis = fizz_spec.exported_rbi_files.map { |path| File.basename(path) }
        assert_equal(["first.rbi"], fizz_rbis)
      end

      it("creates tree with exported RBIs") do
        foo_spec = make_spec("foo")
        foo_export = foo_spec.exported_rbi_tree
        assert_empty(foo_export.conflicts)
        assert_empty(foo_export.tree)

        bar_spec = make_spec("bar")
        bar_export = bar_spec.exported_rbi_tree
        assert_equal(["Conflicting definitions for `::Bar::Test#foo(a, b)`"], bar_export.conflicts.map(&:to_s))
        assert_equal(<<~RBI, bar_export.tree.string)
          # typed: true

          module Bar
            class Test
              sig { params(a: T.nilable(Integer), b: T.nilable(Integer)).void }
              def baz(a = T.unsafe(nil), b = T.unsafe(nil)); end
              <<<<<<< left
              sig { params(a: T.nilable(Integer), b: T.nilable(Integer)).void }
              def foo(a = T.unsafe(nil), b = T.unsafe(nil)); end
              =======
              sig { params(a: T.nilable(Integer)).void }
              def foo(a = T.unsafe(nil)); end
              >>>>>>> right

              sig { params(a: T.nilable(Integer), b: T.nilable(Integer)).void }
              def fizz(a = T.unsafe(nil), b = T.unsafe(nil)); end
            end
          end
        RBI

        fizz_spec = make_spec("fizz")
        fizz_export = fizz_spec.exported_rbi_tree
        assert_empty(fizz_export.conflicts)
        assert_equal(<<~RBI, fizz_export.tree.string)
          # typed: true

          module Fizz
            class << self
              sig { params(a: T.nilable(Integer)).void }
              def baz(a = T.unsafe(nil)); end
            end
          end
        RBI
      end
    end

    private

    sig { params(gem_name: String).returns(Gemfile::GemSpec) }
    def make_spec(gem_name)
      mock = MockGem.new("#{SUPPORT_GEM_PATH}/#{gem_name}")
      Gemfile::GemSpec.new(mock)
    end
  end

  class MockGem < ::Gem::Specification
    extend T::Sig
    extend T::Generic

    Elem = type_template

    sig { params(rel_path: String).void }
    def initialize(rel_path) # rubocop:disable Lint/MissingSuper
      @rel_path = rel_path
    end

    sig { returns(String) }
    def full_gem_path
      @rel_path
    end
  end
end

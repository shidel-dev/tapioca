# typed: true
# frozen_string_literal: true

require "spec_helper"

class Tapioca::Compilers::Dsl::ActiveRecordRelationsSpec < DslSpec
  describe("#initialize") do
    it("gathers no constants if there are no ActiveRecord classes") do
      assert_empty(gathered_constants)
    end

    it("gathers only ActiveRecord constants with no abstract classes") do
      add_ruby_file("post.rb", <<~RUBY)
        class Post < ActiveRecord::Base
        end

        class Product < ActiveRecord::Base
          self.abstract_class = true
        end

        class User
        end
      RUBY

      assert_equal(["Post"], gathered_constants)
    end
  end

  describe("#decorate") do
    it("generates proper relation classes and modules") do
      add_ruby_file("post.rb", <<~RUBY)
        class Post < ActiveRecord::Base
        end
      RUBY

      expected = template(<<~RUBY)
        # typed: strong

        class Post
          extend CommonRelationMethods
          extend GeneratedRelationMethods

        <% if Tapioca::Compilers::Sorbet.supports?(:to_ary_nil_support) %>
          private

          sig { returns(NilClass) }
          def to_ary; end

        <% end %>
          module CommonRelationMethods
            sig { params(block: T.nilable(T.proc.params(record: ::Post).returns(T.untyped))).returns(T::Boolean) }
            def any?(&block); end

            sig { params(column_name: T.any(String, Symbol)).returns(T.untyped) }
            def average(column_name); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def build(attributes = nil, &block); end

            sig { params(operation: Symbol, column_name: T.any(String, Symbol)).returns(T.untyped) }
            def calculate(operation, column_name); end

            sig { params(column_name: T.untyped).returns(T.untyped) }
            def count(column_name = nil); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def create(attributes = nil, &block); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def create!(attributes = nil, &block); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def create_or_find_by(attributes, &block); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def create_or_find_by!(attributes, &block); end

            sig { returns(T::Array[::Post]) }
            def destroy_all; end

            sig { params(conditions: T.untyped).returns(T::Boolean) }
            def exists?(conditions = :none); end

            sig { returns(T.nilable(::Post)) }
            def fifth; end

            sig { returns(::Post) }
            def fifth!; end

            sig { params(args: T.untyped).returns(T.untyped) }
            def find(*args); end

            sig { params(args: T.untyped).returns(T.untyped) }
            def find(*args); end

            sig { params(args: T.untyped).returns(T.nilable(::Post)) }
            def find_by(*args); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def find_or_create_by(attributes, &block); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def find_or_create_by!(attributes, &block); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def find_or_initialize_by(attributes, &block); end

            sig { params(limit: T.untyped).returns(T.untyped) }
            def first(limit = nil); end

            sig { returns(::Post) }
            def first!; end

            sig { returns(T.nilable(::Post)) }
            def forty_two; end

            sig { returns(::Post) }
            def forty_two!; end

            sig { returns(T.nilable(::Post)) }
            def fourth; end

            sig { returns(::Post) }
            def fourth!; end

            sig { returns(Array) }
            def ids; end

            sig { params(record: T.untyped).returns(T::Boolean) }
            def include?(record); end

            sig { params(limit: T.untyped).returns(T.untyped) }
            def last(limit = nil); end

            sig { returns(::Post) }
            def last!; end

            sig { params(block: T.nilable(T.proc.params(record: ::Post).returns(T.untyped))).returns(T::Boolean) }
            def many?(&block); end

            sig { params(column_name: T.any(String, Symbol)).returns(T.untyped) }
            def maximum(column_name); end

            sig { params(record: T.untyped).returns(T::Boolean) }
            def member?(record); end

            sig { params(column_name: T.any(String, Symbol)).returns(T.untyped) }
            def minimum(column_name); end

            sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::Post).void)).returns(::Post) }
            def new(attributes = nil, &block); end

            sig { params(block: T.nilable(T.proc.params(record: ::Post).returns(T.untyped))).returns(T::Boolean) }
            def none?(&block); end

            sig { params(block: T.nilable(T.proc.params(record: ::Post).returns(T.untyped))).returns(T::Boolean) }
            def one?(&block); end

            sig { params(column_names: T.untyped).returns(T.untyped) }
            def pick(*column_names); end

            sig { params(column_names: T.untyped).returns(T.untyped) }
            def pluck(*column_names); end

            sig { returns(T.nilable(::Post)) }
            def second; end

            sig { returns(::Post) }
            def second!; end

            sig { returns(T.nilable(::Post)) }
            def second_to_last; end

            sig { returns(::Post) }
            def second_to_last!; end

            sig { params(column_name: T.nilable(T.any(String, Symbol)), block: T.nilable(T.proc.params(record: T.untyped).returns(T.untyped))).returns(T.untyped) }
            def sum(column_name = nil, &block); end

            sig { params(limit: T.untyped).returns(T.untyped) }
            def take(limit = nil); end

            sig { returns(::Post) }
            def take!; end

            sig { returns(T.nilable(::Post)) }
            def third; end

            sig { returns(::Post) }
            def third!; end

            sig { returns(T.nilable(::Post)) }
            def third_to_last; end

            sig { returns(::Post) }
            def third_to_last!; end
          end

          module GeneratedAssociationRelationMethods
            sig { returns(PrivateAssociationRelation) }
            def all; end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def and(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def annotate(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def create_with(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def distinct(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def eager_load(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def except(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def extending(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def extract_associated(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def from(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def group(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def having(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def includes(*args, &blk); end

            sig { params(attributes: Hash, returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
            def insert(attributes, returning: nil, unique_by: nil); end

            sig { params(attributes: Hash, returning: T.nilable(T.any(T::Array[Symbol], FalseClass))).returns(ActiveRecord::Result) }
            def insert!(attributes, returning: nil); end

            sig { params(attributes: T::Array[Hash], returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
            def insert_all(attributes, returning: nil, unique_by: nil); end

            sig { params(attributes: T::Array[Hash], returning: T.nilable(T.any(T::Array[Symbol], FalseClass))).returns(ActiveRecord::Result) }
            def insert_all!(attributes, returning: nil); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def joins(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def left_joins(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def left_outer_joins(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def limit(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def lock(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def merge(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def none(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def offset(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def only(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def optimizer_hints(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def or(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def order(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def preload(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def readonly(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def references(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def reorder(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def reselect(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def reverse_order(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def rewhere(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def select(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def strict_loading(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def uniq!(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
            def unscope(*args, &blk); end

            sig { params(attributes: Hash, returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
            def upsert(attributes, returning: nil, unique_by: nil); end

            sig { params(attributes: T::Array[Hash], returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
            def upsert_all(attributes, returning: nil, unique_by: nil); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelationWhereChain) }
            def where(*args, &blk); end
          end

          module GeneratedRelationMethods
            sig { returns(PrivateRelation) }
            def all; end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def and(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def annotate(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def create_with(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def distinct(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def eager_load(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def except(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def extending(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def extract_associated(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def from(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def group(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def having(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def includes(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def joins(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def left_joins(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def left_outer_joins(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def limit(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def lock(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def merge(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def none(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def offset(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def only(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def optimizer_hints(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def or(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def order(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def preload(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def readonly(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def references(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def reorder(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def reselect(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def reverse_order(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def rewhere(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def select(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def strict_loading(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def uniq!(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
            def unscope(*args, &blk); end

            sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelationWhereChain) }
            def where(*args, &blk); end
          end

          class PrivateAssociationRelation < ::ActiveRecord::AssociationRelation
            include CommonRelationMethods
            include GeneratedAssociationRelationMethods

            sig { returns(T::Array[::Post]) }
            def to_ary; end

            Elem = type_member(fixed: ::Post)
          end

          class PrivateAssociationRelationWhereChain < PrivateAssociationRelation
            sig { params(args: T.untyped).returns(PrivateAssociationRelation) }
            def missing(*args); end

            sig { params(opts: T.untyped, rest: T.untyped).returns(PrivateAssociationRelation) }
            def not(opts, *rest); end

            Elem = type_member(fixed: ::Post)
          end

          class PrivateCollectionProxy < ::ActiveRecord::Associations::CollectionProxy
            include CommonRelationMethods
            include GeneratedAssociationRelationMethods

            sig { params(records: T.any(::Post, T::Enumerable[T.any(::Post, T::Enumerable[::Post])])).returns(PrivateCollectionProxy) }
            def <<(*records); end

            sig { params(records: T.any(::Post, T::Enumerable[T.any(::Post, T::Enumerable[::Post])])).returns(PrivateCollectionProxy) }
            def append(*records); end

            sig { returns(PrivateCollectionProxy) }
            def clear; end

            sig { params(records: T.any(::Post, T::Enumerable[T.any(::Post, T::Enumerable[::Post])])).returns(PrivateCollectionProxy) }
            def concat(*records); end

            sig { params(records: T.any(::Post, Integer, String, T::Enumerable[T.any(::Post, Integer, String, T::Enumerable[::Post])])).returns(T::Array[::Post]) }
            def delete(*records); end

            sig { params(records: T.any(::Post, Integer, String, T::Enumerable[T.any(::Post, Integer, String, T::Enumerable[::Post])])).returns(T::Array[::Post]) }
            def destroy(*records); end

            sig { returns(T::Array[::Post]) }
            def load_target; end

            sig { params(records: T.any(::Post, T::Enumerable[T.any(::Post, T::Enumerable[::Post])])).returns(PrivateCollectionProxy) }
            def prepend(*records); end

            sig { params(records: T.any(::Post, T::Enumerable[T.any(::Post, T::Enumerable[::Post])])).returns(PrivateCollectionProxy) }
            def push(*records); end

            sig { params(other_array: T.any(::Post, T::Enumerable[T.any(::Post, T::Enumerable[::Post])])).returns(T::Array[::Post]) }
            def replace(other_array); end

            sig { returns(PrivateAssociationRelation) }
            def scope; end

            sig { returns(T::Array[::Post]) }
            def target; end

            sig { returns(T::Array[::Post]) }
            def to_ary; end

            Elem = type_member(fixed: ::Post)
          end

          class PrivateRelation < ::ActiveRecord::Relation
            include CommonRelationMethods
            include GeneratedRelationMethods

            sig { returns(T::Array[::Post]) }
            def to_ary; end

            Elem = type_member(fixed: ::Post)
          end

          class PrivateRelationWhereChain < PrivateRelation
            sig { params(args: T.untyped).returns(PrivateRelation) }
            def missing(*args); end

            sig { params(opts: T.untyped, rest: T.untyped).returns(PrivateRelation) }
            def not(opts, *rest); end

            Elem = type_member(fixed: ::Post)
          end
        end
      RUBY

      assert_equal(expected, rbi_for(:Post))
    end
  end
end

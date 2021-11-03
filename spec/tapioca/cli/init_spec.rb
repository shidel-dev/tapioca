# typed: strict
# frozen_string_literal: true

require "spec_with_project"

module Tapioca
  class InitSpec < SpecWithProject
    describe("#cli::init") do
      before(:all) do
        project.bundle_install
      end

      after do
        @project.remove("sorbet/config")
        @project.remove("sorbet/tapioca")
        @project.remove("bin/tapioca")
      end

      it "must create proper files" do
        out, err, status = @project.tapioca("init")

        assert_includes(out, "create  sorbet/config")
        assert_includes(out, "create  sorbet/tapioca/require.rb")
        assert_includes(out, "create  bin/tapioca")

        assert_equal(<<~CONFIG, @project.read("sorbet/config"))
          --dir
          .
        CONFIG

        assert_project_file_equal("sorbet/tapioca/require.rb", <<~RB)
          # typed: true
          # frozen_string_literal: true

          # Add your extra requires here (`bin/tapioca require` can be used to boostrap this list)
        RB

        assert_project_file_exist("bin/tapioca")

        assert_empty(err)
        assert(status)
      end

      it "must not overwrite files" do
        @project.write("bin/tapioca")
        @project.write("sorbet/config")
        @project.write("sorbet/tapioca/require.rb")

        out, err, status = @project.tapioca("init")

        assert_includes(out, "skip  sorbet/config")
        assert_includes(out, "skip  sorbet/tapioca/require.rb")
        assert_includes(out, "force  bin/tapioca")

        assert_empty(@project.read("sorbet/config"))
        assert_empty(@project.read("sorbet/tapioca/require.rb"))

        assert_empty(err)
        assert(status)
      end
    end
  end
end

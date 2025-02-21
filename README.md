> :warning: **Note**: This software is currently under active development. The API and interface should be considered unstable until a v1.0.0 release.

# Tapioca

![Build Status](https://github.com/Shopify/tapioca/workflows/CI/badge.svg)

Tapioca is a library used to generate RBI (Ruby interface) files for use with [Sorbet](https://sorbet.org). RBI files provide the structure (classes, modules, methods, parameters) of the gem/library to Sorbet to assist with typechecking.

As yet, no gem exports type information in a consumable format and it would be a huge effort to manually maintain such an interface file for all the gems that your codebase depends on. Thus, there is a need for an automated way to generate the appropriate RBI file for a given gem. The `tapioca` gem, developed at Shopify, is able to do exactly that to almost 99% accuracy. It can generate the definitions for all statically defined types and most of the runtime defined types exported from Ruby gems (non-Ruby gems are not handled yet).

When you run `tapioca gem` in a project, `tapioca` loads all the gems that are in your dependency list from the Gemfile into memory. It then performs runtime introspection on the loaded types to understand their structure and generates an appropriate RBI file for each gem with a versioned filename.

## Manual gem requires

For gems that have a normal default `require` and load all of their constants through such a require, everything works seamlessly. However, for gems that are marked as `require: false` in the Gemfile, or for gems that export optionally loaded types via different requires, where a single require does not load the whole gem code into memory, `tapioca` will not be able to load some of the types into memory and, thus, won't be able to generate complete RBIs for them. For this reason, we need to keep a small external file named `sorbet/tapioca/require.rb` that is executed after all the gems in the Gemfile have been required and before generation of gem RBIs have started. This file is responsible for adding the requires for additional files from gems, which are not covered by the default require.

For example, suppose you are using the class `BetterHtml::Parser` exported from the `better_html` gem. Just doing a `require "better_html"` (which is the default require) does not load that type:

```shell
$ bundle exec pry
[1] pry(main)> require 'better_html'
=> true
[2] pry(main)> BetterHtml
=> BetterHtml
[3] pry(main)> BetterHtml::Parser
NameError: uninitialized constant BetterHtml::Parser
from (pry):3:in `__pry__`
[4] pry(main)> require 'better_html/parser'
=> true
[5] pry(main)> BetterHtml::Parser
=> BetterHtml::Parser
```

In order to make sure that `tapioca` can reflect on that type, we need to add the line `require "better_html/parser"` to the `sorbet/tapioca/require.rb` file. This will make sure `BetterHtml::Parser` is loaded into memory and a type annotation is generated for it in the `better_html.rbi` file. If this extra `require` line is not added to `sorbet/tapioca/require.rb` file, then the definition for that type will be missing from the RBI file.

If you ever run into a case, where you add a gem or update the version of a gem and run `tapioca gem` but don't have some types you expect in the generated gem RBI files, you will need to make sure you have added the necessary requires to the `sorbet/tapioca/require.rb` file.

You can use the command `tapioca require` to auto-populate the `sorbet/tapioca/require.rb` file with all the requires found
in your application. Once the file generated, you should review it, remove all unnecessary requires and commit it.

## How does tapioca compare to "srb rbi gems" ?

[Please see the detailed answer on our wiki](https://github.com/Shopify/tapioca/wiki/How-does-tapioca-compare-to-%22srb-rbi-gems%22-%3F)

## Installation

Add this line to your application's `Gemfile`:

```ruby
group :development do
  gem 'tapioca', require: false
end
```

and do not forget to execute `tapioca` using `bundler`:

```shell
$ bundle exec tapioca
Commands:
  tapioca --version, -v      # show version
  tapioca dsl [constant...]  # generate RBIs for dynamic methods
  tapioca gem [gem...]       # generate RBIs from gems
  tapioca help [COMMAND]     # Describe available commands or one specific command
  tapioca init               # initializes folder structure
  tapioca require            # generate the list of files to be required by tapioca
  tapioca todo               # generate the list of unresolved constants

Options:
  --out, -o, [--outdir=directory]              # The output directory for generated RBI files
  --cmd, -c, [--generate-command=command]      # The command to run to regenerate RBI files
          [--file-header], [--no-file-header]  # Add a "This file is generated" header on top of each generated RBI file
                                               # Default: true
  -V, [--verbose], [--no-verbose]              # Verbose output for debugging purposes
```

## Usage

### Initialize folder structure

Command: `tapioca init`

This will create the `sorbet/config` and `sorbet/tapioca/require.rb` files for you, if they don't exist. If any of the files already exist, they will not be changed.

```shell
$ bundle exec tapioca help init
Usage:
  tapioca init

Options:
  --out, -o, [--outdir=directory]              # The output directory for generated RBI files
  --cmd, -c, [--generate-command=command]      # The command to run to regenerate RBI files
          [--file-header], [--no-file-header]  # Add a "This file is generated" header on top of each generated RBI file
                                               # Default: true
  -V, [--verbose], [--no-verbose]              # Verbose output for debugging purposes

initializes folder structure
```

### Generate RBI files for gems

Command: `tapioca gem [gems...]`

This will generate RBIs for the specified gems and place them in the RBI directory.

```shell
$ bundle exec tapioca help gem
Usage:
  tapioca gem [gem...]

Options:
          [--all], [--no-all]                                 # Regenerate RBI files for all gems
  --pre, -b, [--prerequire=file]                              # A file to be required before Bundler.require is called
  --post, -a, [--postrequire=file]                            # A file to be required after Bundler.require is called
  -x, [--exclude=gem [gem ...]]                               # Excludes the given gem(s) from RBI generation
  --typed, -t, [--typed-overrides=gem:level [gem:level ...]]  # Overrides for typed sigils for generated gem RBIs
          [--verify], [--no-verify]                           # Verifies RBIs are up-to-date
  --out, -o, [--outdir=directory]                             # The output directory for generated RBI files
  --cmd, -c, [--generate-command=command]                     # The command to run to regenerate RBI files
          [--file-header], [--no-file-header]                 # Add a "This file is generated" header on top of each generated RBI file
                                                              # Default: true
  -V, [--verbose], [--no-verbose]                             # Verbose output for debugging purposes

generate RBIs from gems
```

### Generate the list of all unresolved constants

Command: `tapioca todo`

This will generate the file `sorbet/rbi/todo.rbi` defining all unresolved constants as empty modules.

```shell
$ bundle exec tapioca help todo
Usage:
  tapioca todo

Options:
  --out, -o, [--outdir=directory]              # The output directory for generated RBI files
  --cmd, -c, [--generate-command=command]      # The command to run to regenerate RBI files
          [--file-header], [--no-file-header]  # Add a "This file is generated" header on top of each generated RBI file
                                               # Default: true
  -V, [--verbose], [--no-verbose]              # Verbose output for debugging purposes

generate the list of unresolved constants
```

### Generate DSL RBI files

Command: `tapioca dsl [constant...]`

This will generate DSL RBIs for specified constants (or for all handled constants, if a constant name is not supplied). You can read about DSL RBI generators supplied by `tapioca` in [the manual](manual/generators.md).

```shell
$ bundle exec tapioca help dsl
Usage:
  tapioca dsl [constant...]

Options:
  --gen, -g, [--generators=generator [generator ...]]       # Only run supplied DSL generators
          [--exclude-generators=generator [generator ...]]  # Exclude supplied DSL generators
          [--verify], [--no-verify]                         # Verifies RBIs are up-to-date
  -q, [--quiet], [--no-quiet]                               # Supresses file creation output
  --out, -o, [--outdir=directory]                           # The output directory for generated RBI files
  --cmd, -c, [--generate-command=command]                   # The command to run to regenerate RBI files
          [--file-header], [--no-file-header]               # Add a "This file is generated" header on top of each generated RBI file
                                                            # Default: true
  -V, [--verbose], [--no-verbose]                           # Verbose output for debugging purposes

generate RBIs for dynamic methods
```

### Flags

- `--prerequire [file]`: A file to be required before `Bundler.require` is called.
- `--postrequire [file]`: A file to be required after `Bundler.require` is called.
- `--out [directory]`: The output directory for generated RBI files, default to `sorbet/rbi/gems`.
- `--generate-command [command]`: **[DEPRECATED]** The command to run to regenerate RBI files (used in header comment of the RBI files), defaults to the current command.
- `--typed-overrides [gem:level]`: Overrides typed sigils for generated gem RBIs for gem `gem` to level `level` (`level` can be one of `ignore`, `false`, `true`, `strict`, or `strong`, see [the Sorbet docs](https://sorbet.org/docs/static#file-level-granularity-strictness-levels) for more details).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Shopify/tapioca. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/Shopify/tapioca/blob/main/CODE_OF_CONDUCT.md) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/Shopify/tapioca/blob/main/LICENSE.txt).

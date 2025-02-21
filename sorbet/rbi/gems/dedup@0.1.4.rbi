# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dedup` gem.
# Please instead update this file by running `bin/tapioca gem dedup`.

# typed: true

module Dedup
  extend ::Dedup::Native
end

Dedup::DEDUP_FROZEN_STRINGS = T.let(T.unsafe(nil), TrueClass)
Dedup::DEDUP_HASH_ASET = T.let(T.unsafe(nil), TrueClass)
Dedup::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)
Dedup::EMPTY_HASH = T.let(T.unsafe(nil), Hash)
class Dedup::Error < ::StandardError; end

module Dedup::Native
  extend ::Dedup::Native

  def deep_intern!(_arg0); end
end

module Dedup::Ruby
  extend ::Dedup::Ruby

  def deep_intern!(data); end
end

Dedup::VERSION = T.let(T.unsafe(nil), String)

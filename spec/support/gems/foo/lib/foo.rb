# typed: true
# frozen_string_literal: true

module Foo
  PI = Math::PI
  PI2 = 2 * PI

  def self.foo(a = 1, b: 2, **opts)
    number = opts[:number] || 0
    39 + a + b + number
  end
end

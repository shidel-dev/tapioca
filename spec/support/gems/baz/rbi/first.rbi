# typed: true

module Baz
  sig { params(a: T.nilable(Integer)).void }
  def foo(a = T.unsafe(nil)); end
end

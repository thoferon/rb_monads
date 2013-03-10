$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "rb_monads/constants"

Gem::Specification.new do |s|
  s.name = "rb_monads"
  s.version = RbMonads::VERSION
  s.authors = ["Thomas Feron"]
  s.description = "Simple implementation of monads"
  s.summary = "rb_monads-#{s.version}"
  s.email = "tho.feron@gmail.com"
  s.homepage = "https://github.com/thoferon"

  s.platform = Gem::Platform::RUBY

  s.files = `git ls-files`.split("\n").reject { |path| path =~ /\.gitignore$/ }
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_path = "lib"
end

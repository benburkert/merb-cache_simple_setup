require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'

PROJECT_NAME = "merb-cache_simple_setup"
GEM = "merb-cache_simple_setup"
GEM_VERSION = "0.1.0"
AUTHOR = "Ben Burkert"
EMAIL = "ben@benburkert.com"
HOMEPAGE = "http://github.com/benburkert/merb-cache_simple_setup"
TITLE = "merb-cache simple setup"
SUMMARY = "Library to make setting up merb-cache a tad easier."
FILES = %w(Rakefile) + Dir.glob("{lib}/**/*")

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  s.require_path = 'lib'
  s.autorequire = GEM
  s.files = FILES
end

Rake::GemPackageTask.new(spec) do |package|
  package.gem_spec = spec
  package.need_zip = true
  package.need_tar = true
end
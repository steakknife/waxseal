$:.push File.expand_path('../lib', __FILE__)
require 'waxseal/version'
Gem::Specification.new do |s|
  s.name = 'waxseal'
  s.version = Waxseal::VERSION
  s.authors = ['Barry Allard']
  s.email = ['barry.allard@gmail.com']
  s.homepage = 'https://github.com/steakknife/waxseal'
  s.summary = 'Sign thee gems with a fancy, vintage wax seal'
  s.license = 'MIT'
  s.description = <<-EOF
  Adds certificate stuff to your gems.
EOF
  s.bindir = 'bin'

  s.files = Dir['{lib,vendor}/**/*'] + ['LICENSE', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'shoulda'
end

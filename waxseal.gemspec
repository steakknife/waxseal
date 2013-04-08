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
  s.executables = s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.post_install_message = <<-EOF
  : post-install notes :

  In this order...

     - If rbenv is installed, run:

         rbenv rehash

     - If ZSH is installed, run:

         rehash

  And then just cd to any of your gem's unsigned source directory and run `waxseal`

  Thanks for installing waxseal. 
EOF

  s.files = Dir['{lib,vendor}/**/*'] + ['LICENSE', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'shoulda'
end
.tap {|gem| gem.signing_key = File.expand_path(File.join('~/.keys', 'gem-private_key.pem')) ; gem.cert_chain = ['gem-public_cert.pem']} # pressed firmly by waxseal

$:.push File.expand_path('../lib', __FILE__)
require 'waxseal/version'
Gem::Specification.new do |s|
  s.name = 'waxseal'
  s.version = Waxseal::VERSION
  s.authors = ['Barry Allard']
  s.email = ['barry.allard@gmail.com']
  s.homepage = github_url = 'http://rubygems.org/gems/rails'
  s.metadata = {
    'source_code_uri' => "#{github_url}.git",
#   'documentation_uri' => "",
        'project_uri' => github_url,
    'bug_tracker_uri' => "#{github_url}/issues",
           'wiki_uri' => "#{github_url}/wiki",
#    'mailing_list_uri' => "", 
  }
  s.summary = 'Sign thee gems with a fancy, vintage wax seal'
  s.license = 'MIT'
  s.description = <<-EOF
  Adds certificate stuff to your gems.
EOF
  s.executables = s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.post_install_message = <<-EOF

  :: waxseal | post-install notes ::

  In this order...

     - If rbenv is installed, run:

         rbenv rehash

     - If ZSH is installed, run:

         rehash

  And then just cd to any of your gem's unsigned source directory and run `waxseal`

  Thanks for installing waxseal. 


EOF

  s.files = Dir['{lib,vendor}/**/*'] + ['LICENSE', 'README.md']

end

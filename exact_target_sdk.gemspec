require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'exact_target_sdk', 'version'))

Gem::Specification.new do |s|

  # definition
  s.name = %q{exact_target_sdk}
  s.version = ExactTargetSDK::VERSION

  # details
  s.date = %q{2012-01-30}
  s.summary = %q{A simple wrapper for the ExactTarget SOAP API.}
  s.description = %q{Provides an easy-to-use ruby interface into the ExactTarget SOAP API, using the Savon client.}
  s.authors = [ 'David Dawson' ]
  s.email = %q{daws23@gmail.com}
  s.homepage = %q{https://github.com/daws/exact_target_sdk}
  s.require_paths = [ 'lib' ]
  
  # documentation
  s.has_rdoc = true
  s.extra_rdoc_files = %w( README.rdoc CHANGELOG.rdoc LICENSE.txt )
  s.rdoc_options = %w( --main README.rdoc )

  # files to include
  s.files = Dir[ 'lib/**/*.rb', 'README.rdoc', 'CHANGELOG.rdoc', 'LICENSE.txt' ]

  # dependencies
  s.add_dependency 'activemodel', '~> 3.0'
  s.add_dependency 'activesupport', '~> 3.0'
  s.add_dependency 'guid', '~> 0.1'
  s.add_dependency 'savon', '<= 0.9.9'

end

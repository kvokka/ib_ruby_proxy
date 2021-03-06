lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ib_ruby_proxy/version'

Gem::Specification.new do |spec|
  spec.name          = 'ib_ruby_proxy'
  spec.version       = IbRubyProxy::VERSION
  spec.authors       = ['Jorge Manrubia']
  spec.email         = ['jorge.manrubia@gmail.com']

  spec.summary       = 'Invoke IB Java API from Ruby'
  spec.description   = 'Invoke IB Java API from Ruby'
  spec.homepage      = 'https://github.com/jorgemanrubia/ib_ruby_proxy'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.5.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/jorgemanrubia/ib_ruby_proxy'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'concurrent-ruby'
  spec.add_development_dependency 'amazing_print'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'commander'
  spec.add_development_dependency 'impersonator'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.8.0'
  spec.add_development_dependency 'rspec_junit_formatter'
end

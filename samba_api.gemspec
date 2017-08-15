# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'samba_api/version'

Gem::Specification.new do |spec|
  spec.name          = "samba_api"
  spec.version       = SambaApi::VERSION
  spec.authors       = ["Leandro"]
  spec.email         = ["lndr.figueredo@gmail.com"]

  spec.summary       = %q{Samba Videos API}
  spec.description   = %q{Easy way to integrate your app with samba videos api}
  spec.homepage      = "http://docs.sambavideos.sambatech.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "simplecov"
  spec.add_dependency "httparty"
  spec.add_dependency "json"
  spec.add_dependency "rest-client"

end


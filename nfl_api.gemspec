lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nfl_api/version"

Gem::Specification.new do |spec|
  spec.name          = "nfl_api"
  spec.version       = NFLApi::VERSION
  spec.authors       = ["Pat George"]
  spec.email         = ["pat.george@gmail.com"]

  spec.summary       = %q{Ruby wrapper for NFL.com's API.}
  spec.description   = %q{Ruby wrapper for NFL.com's API.}
  spec.homepage      = "https://github.com/pcg79/nfl_api"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = "https://github.com/pcg79/nfl_api"
  spec.metadata["source_code_uri"] = "https://github.com/pcg79/nfl_api"
  spec.metadata["changelog_uri"] = "https://github.com/pcg79/nfl_api/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "webmock"
end

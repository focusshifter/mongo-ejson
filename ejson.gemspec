
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ejson/version"

Gem::Specification.new do |spec|
  spec.name          = "mongo-ejson"
  spec.version       = EJSON::VERSION
  spec.authors       = ["Alex Bondar"]
  spec.email         = ["mongo-ejson-gem@db-ai.co"]

  spec.summary       = %q{MongoDB Extended JS(ON) parser}
  spec.description   = %q{Parses MongoDB favoured JS(ON) string into objects}
  spec.homepage      = "https://gibhub.com/db-ai/mongo-ejson"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this
  # section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://gibhub.com/db-ai/mongo-ejson"
    spec.metadata["changelog_uri"] = "https://gibhub.com/db-ai/mongo-ejson"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
          "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been
  # added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "bson"
end

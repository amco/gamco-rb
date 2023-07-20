# frozen_string_literal: true

require_relative "lib/gamco/version"

Gem::Specification.new do |spec|
  spec.name = "gamco"
  spec.version = Gamco::VERSION
  spec.authors = ["Alejandro Gutiérrez"]
  spec.email = ["alejandrodevs@gmail.com"]

  spec.summary = "Google Analytics helpers for ruby applications."
  spec.description = "This gem aims to provide a simple and easy way to send data to Google Analytics."
  spec.homepage = "https://github.com/amco/gamco-rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .travis .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rails", ">= 5.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

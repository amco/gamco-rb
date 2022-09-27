# frozen_string_literal: true

module Gamco
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      desc "Creates Gamco initializer."

      def create_initializer
        template "gamco.rb", "config/initializers/gamco.rb"
      end
    end
  end
end

# frozen_string_literal: true

module Gamco
  module Errors
    class NoTagId < StandardError
      def initialize(message = "Configure your TAG_ID in your initializer.")
        super
      end
    end
  end
end

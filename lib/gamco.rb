# frozen_string_literal: true

require_relative "gamco/version"
require_relative "gamco/builder"
require_relative "gamco/helper"
require_relative "gamco/configuration"

module Gamco
  extend Configuration
end

ActiveSupport.on_load(:action_view) do
  include Gamco::Helper
end

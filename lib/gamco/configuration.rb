# frozen_string_literal: true

module Gamco
  module Configuration
    mattr_accessor :tag_id, default: nil

    mattr_accessor :secure, default: -> (value) do
      Digest::MD5.hexdigest(value)
    end

    def setup
      yield(self) if block_given?
    end
  end
end

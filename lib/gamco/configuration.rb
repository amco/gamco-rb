# frozen_string_literal: true

module Gamco
  module Configuration
    mattr_accessor :tag_id, default: nil
    mattr_accessor :active, default: false

    mattr_accessor :secure, default: lambda { |value|
      Digest::MD5.hexdigest(value)
    }

    def setup
      yield(self) if block_given?
    end
  end
end

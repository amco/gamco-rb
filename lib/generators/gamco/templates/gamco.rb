# frozen_string_literal: true

Gamco.setup do |config|
  # ===> Required GA4 configuration options
  # config.tag_id = "G-XXXXXXXXXXX"

  # ===> Method to secure sensitive data.
  # config.secure = -> (value) {
  #   Digest::MD5.hexdigest(value)
  # }
end

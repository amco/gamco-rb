# frozen_string_literal: true

module Gamco
  module Helper
    def ga_javascript_tags(tag_id: Configuration.tag_id, **options)
      raise Errors::NoTagId unless tag_id.present?
      ga_builder.javascript_tags(tag_id, options)
    end

    def ga_tag(type, event, options = {})
      ga_builder.tag(type, event, options)
    end

    def ga_secure(value)
      return unless value.present?
      Configuration.secure.call(value)
    end

    private

    def ga_builder
      @ga_builder ||= Gamco::Builder.new(self)
    end
  end
end

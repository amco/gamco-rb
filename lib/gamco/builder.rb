# frozen_string_literal: true

module Gamco
  class Builder
    attr_reader :view

    def initialize(view)
      @view = view
    end

    def javascript_tags(tag_id, options = {})
      gtag_manager_script(tag_id) +
        gtag_script(tag_id, options)
    end

    def tag(type, event, options = {})
      view.content_tag(:script) do
        dimensions = options.to_json
        "gtag('#{type}', '#{event}', #{dimensions})".html_safe
      end
    end

    private

    def gtag_manager_script(tag_id)
      view.content_tag :script, "", async: true,
        src: "#{tag_manager_script_url}?id=#{tag_id}"
    end

    def gtag_script(tag_id, options)
      view.content_tag(:script) do
        gtag_script_content(tag_id, options).html_safe
      end
    end

    def gtag_script_content(tag_id, options)
      "window.dataLayer = window.dataLayer || [];"\
      "function gtag(){dataLayer.push(arguments);}"\
      "gtag('js', new Date());"\
      "gtag('config', '#{tag_id}', #{options.to_json});"
    end

    def tag_manager_script_url
      "https://www.googletagmanager.com/gtag/js"
    end
  end
end

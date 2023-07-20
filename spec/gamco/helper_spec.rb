# frozen_string_literal: true

class HelperClass < ActionView::Base
  include Gamco::Helper
end

RSpec.describe Gamco::Helper do
  subject(:helper) { HelperClass.new(ActionView::LookupContext.new([]), {}, nil) }

  describe "#ga_javascript_tags" do
    context "when is active and tag id is configured" do
      let(:tag_id) { "XXX" }

      let(:script_tags) do
        "<script async=\"async\" src=\"" \
          "https://www.googletagmanager.com/gtag/js?id=#{tag_id}\"></script>" \
          "<script>" \
          "window.dataLayer = window.dataLayer || [];" \
          "function gtag(){dataLayer.push(arguments);}" \
          "gtag('js', new Date());" \
          "gtag('config', '#{tag_id}', {});" \
          "</script>"
      end

      before do
        Gamco::Configuration.active = true
        Gamco::Configuration.tag_id = tag_id
      end

      it "returns script tags" do
        expect(helper.ga_javascript_tags).to eql script_tags
      end
    end

    context "when is active and tag id is not configured" do
      before do
        Gamco::Configuration.active = true
        Gamco::Configuration.tag_id = nil
      end

      it "raises Errors::NoTagId error" do
        expect { helper.ga_javascript_tags }
          .to raise_error(Gamco::Errors::NoTagId)
      end
    end

    context "when is not active" do
      before { Gamco::Configuration.active = false }

      it "returns nil" do
        expect(helper.ga_javascript_tags).to be_nil
      end
    end
  end

  describe "#ga_tag" do
    let(:type)    { "event" }
    let(:event)   { "test_event" }
    let(:options) { { foo: :bar } }

    context "when is active" do
      before { Gamco::Configuration.active = true }

      it "returns tag script" do
        expect(helper.ga_tag(type, event, options))
          .to eql("<script>gtag('event', 'test_event', {\"foo\":\"bar\"})</script>")
      end
    end

    context "when is not active" do
      before { Gamco::Configuration.active = false }

      it "returns nil" do
        expect(helper.ga_tag(type, event, options)).to be_nil
      end
    end
  end

  describe "#ga_secure" do
    context "when value is nil" do
      it "returns nil" do
        expect(helper.ga_secure(nil)).to be_nil
      end
    end

    context "when value is not present" do
      it "returns nil" do
        expect(helper.ga_secure("")).to be_nil
      end
    end

    context "when value is present" do
      it "returns digest value" do
        expect(helper.ga_secure("123")).to eql Digest::MD5.hexdigest("123")
      end
    end
  end
end

# frozen_string_literal: true

RSpec.describe Gamco::Helper do
  class HelperClass
    include Gamco::Helper
  end

  subject { HelperClass.new }

  describe "#ga_secure" do
    context "when value is not present" do
      it "returns nil" do
        expect(subject.ga_secure(nil)).to be nil
        expect(subject.ga_secure("")).to be nil
      end
    end

    context "when value is present" do
      it "returns digest value" do
        expect(subject.ga_secure("123")).to eql Digest::MD5.hexdigest("123")
      end
    end
  end
end

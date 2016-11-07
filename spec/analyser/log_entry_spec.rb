require "spec_helper"
require "analyser/log_entry"

RSpec.describe Analyser::LogEntry do
  let(:log_entry) { described_class.new(path: "/contact", ip_address: "184.123.665.067" ) }

  describe "#path" do
    it "returns the path" do
      expect(log_entry.path).to eq("/contact")
    end
  end

  describe "#ip_address" do
    it "returns the IP address" do
      expect(log_entry.ip_address).to eq("184.123.665.067")
    end
  end
end

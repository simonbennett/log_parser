require "spec_helper"
require "analyser/line_parser"
require "analyser/log_entry"

RSpec.describe Analyser::LineParser do
  let(:parser) { described_class.new }
  let(:line) { "/contact 184.123.665.067"  }

  describe "#parse" do
    it "returns a log entry" do
      log_entry = parser.parse(line)

      expect(log_entry.path).to eq("/contact")
      expect(log_entry.ip_address).to eq("184.123.665.067")
    end
  end
end

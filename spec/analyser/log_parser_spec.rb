require "spec_helper"
require "analyser/log_parser"

RSpec.describe Analyser::LogParser do
  let(:filename) { "spec/fixtures/example.log" }
  let(:parser) { described_class.new(filename) }

  it "converts lines into log entries" do
    log_entry = parser.log_entries.first

    expect(log_entry.path).to eq('/help_page/1')
    expect(log_entry.ip_address).to eq('126.318.035.038')
  end

  it "converts each line of the log into a log entry" do
    expect(parser.log_entries.size).to eq(6)
  end

end

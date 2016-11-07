require 'spec_helper'
require 'analyser/report'
require 'analyser/log_parser'
require 'analyser/log_entry'

RSpec.describe Analyser::Report do
  let(:log_entries) do
    [
      Analyser::LogEntry.new(path: "/help_page/1" , ip_address: "126.318.035.038"),
      Analyser::LogEntry.new(path: "/contact" , ip_address: "184.123.665.067"),
      Analyser::LogEntry.new(path: "/contact" , ip_address: "184.123.665.068"),
      Analyser::LogEntry.new(path: "/home", ip_address: "184.123.665.067"),
      Analyser::LogEntry.new(path: "/home", ip_address: "184.123.665.068"), 
      Analyser::LogEntry.new(path: "/home", ip_address: "184.123.665.069")
    ]
  end
  let(:parser) { instance_double(Analyser::LogParser, log_entries: log_entries) }
  let(:report) { described_class.new(parser) }

  describe "#visits" do
    it "returns hash of paths ordered by total visits in descending order" do
      expect(report.visits.first).to eq({path: "/home", count: 3 })
    end
  end

  describe "#unique_visits" do
    it "returns hash of paths ordered by unique visits in descending order" do
      expect(report.unique_visits.first).to eq({path: "/home", count: 3 })
    end
  end

end

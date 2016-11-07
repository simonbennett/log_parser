require 'analyser/line_parser'
require 'analyser/report'

module Analyser
  class LogParser

    attr_reader :log_entries

    def initialize(filename, line_parser=Analyser::LineParser.new)
      @filename = filename
      @line_parser = line_parser
      @log_entries = []

      parse
    end

    private
    def parse
      File.foreach(@filename) do |line|
        create_log_entry(line)
      end
    end

    def create_log_entry(line)
      @log_entries << @line_parser.parse(line)
    end

  end
end

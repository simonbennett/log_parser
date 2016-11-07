require 'set'

module Analyser
  class Report
    def initialize(parser)
      @parser = parser
      @log_entries = parser.log_entries
      @visits = Hash.new { |h, k| h[k] = 0 }
      @unique_visits = Hash.new { |h, k| h[k] = Set.new }

      calculate_visits
      calculate_unique_visits
    end

    def visits
      @visits.sort_by { |path, visits| visits }
        .reverse!
        .map { |path, visits| { path: path, count: visits  } }
    end

    def unique_visits
      @unique_visits.sort_by { |path, ips| ips.size }
        .reverse!
        .map { |path, unique_visits| { path: path, count: unique_visits.size } }
    end

    private
    def calculate_visits
      @log_entries.each do |log_entry|
        @visits[log_entry.path] += 1
      end
    end

    def calculate_unique_visits
      @log_entries.each do |log_entry|
        @unique_visits[log_entry.path] << log_entry.ip_address
      end
    end

  end
end

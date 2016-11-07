require 'analyser/log_entry'

module Analyser
  class LineParser
    def parse(line)
      path, ip_address = line.chomp.split(/\s+/)
      LogEntry.new(path: path, ip_address: ip_address)
    end
  end
end

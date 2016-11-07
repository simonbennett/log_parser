module Analyser
  class LogEntry
    attr_reader :path, :ip_address

    def initialize(path:, ip_address:)
      @path = path
      @ip_address = ip_address
    end
  end
end

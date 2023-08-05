# encoding: UTF-8
module Jparzer
  class Json
    include Enumerable

    attr_reader :path

    # Raises an error if file not found and sets some instance
    # variables if file is found.
    #
    # path - A String or Path to the json
    def initialize(path:, options: {})
      raise Jparzer::FileNotFound unless File.exists?(path)

      @path = path
    end
  end
end

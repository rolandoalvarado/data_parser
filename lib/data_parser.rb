require_relative 'data_parser/json.rb'

module DataParser
  extend self

  # Default exception class for DataParser.
  class Exception < ::StandardError
  end

  # Exception that is raised if file is not found.
  class FileNotFound < DataParser::Exception
  end

  # Exception that is raised if path is empty.
  class PathMissing < DataParser::Exception
  end

  # Exception that is raised if param is an empty string.
  class EmptyString < DataParser::Exception
  end

  def self.parse(path:)
    DataParser::Json.new(path:)
  end
end

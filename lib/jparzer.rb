module Jparzer
  extend self

  # Default exception class for Grim.
  class Exception < ::StandardError
  end

  # Exception that is raised if file is not found.
  class FileNotFound < Jparzer::Exception
  end

  # Exception that is raised if an empty path is passed to Grim::Page#save
  class PathMissing < Jparzer::Exception
  end

  # Exception that is raised if Grim::Page#save can't process the page
  class UnprocessableFile < Jparzer::Exception
  end

  def self.parze(path:)
    Jparzer::Json.new(path:)
  end
end

require 'json'
require 'ostruct'

module DataParser
  class Json
    attr_reader :path

    def initialize(path:)
      raise DataParser::PathMissing if path.nil?
      raise DataParser::FileNotFound unless File.exists?(path)

      @path = path
    end

    def process(params: {})
      names = []
      emails = []
      file = File.read(path)
      search_string = params[params.keys.first.to_sym] if params.any?

      json_data(file:).each do |data|
        data.map do |key, value|
          if matching_name?(key:, search_string:, full_name: value)
            names << data
          elsif key == 'email'
            emails << value
          end
        end
      end

      OpenStruct.new(names:, emails: get_duplicates(array: emails))
    end

    private

    def matching_name?(key:, search_string:, full_name:)
      key == 'full_name' && search_for(search_string:, value: full_name)
    end

    def get_duplicates(array:)
      duplicates = []
      array.each do |element|
        duplicates << element if array.count(element) > 1
      end
      duplicates.uniq
    end

    def search_for(search_string:, value:)
      value =~ /^#{search_string}/i
    end

    def json_data(file:)
      @json_data ||= JSON.parse(file)
    end
  end
end

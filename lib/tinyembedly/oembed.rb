module Tinyembedly
  class Oembed
    include HTTParty
    base_uri BASE_URI

    attr_reader :response, :api_key, :url, :other_params
    @@api_key = nil

    def self.api_key=(value)
      @@api_key = value
    end

    def self.to_hash(url)
      oembed = Oembed.new(:url => url)
      oembed.to_hash
    end

    def initialize(options = {})
      @api_key = options.delete(:api_key) || @@api_key
      @url = options.delete(:url)
      @other_params = options
    end

    def to_hash
      response = get_oembed
      case response.code
      when 200
        response.parsed_response
      else
        raise ResponseError.new(response)
      end
    end

    def get_oembed
      self.class.get(endpoint, :query => params)
    end

    def params
      { :url => @url, :key => @api_key }.merge(@other_params)
    end

    protected

    def endpoint
      "/1/oembed"
    end
  end
end

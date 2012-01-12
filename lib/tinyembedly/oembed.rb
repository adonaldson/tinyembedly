require 'httparty'

module Tinyembedly
  class Oembed
    include HTTParty
    base_uri 'api.embed.ly'

    attr_reader :response, :api_key, :url
    @@api_key = nil

    def self.api_key=(value)
      @@api_key = value
    end

    def self.to_hash(url)
      oembed = Oembed.new(:url => url)
      oembed.to_hash
    end

    def initialize(options = {})
      @api_key = options[:api_key] || @@api_key
      @url = options[:url]
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
      get(endpoint, :query => params)
    end

    def params
      { :url => @url, :key => @api_key }
    end

    protected

    def endpoint
      "/1/oembed"
    end
  end
end

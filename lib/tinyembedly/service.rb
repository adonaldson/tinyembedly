module Tinyembedly
  class Service
    include HTTParty
    
    def self.services
      if !defined?(@@services) || @@services.nil?
        res = get("http://#{BASE_URI}/1/services/ruby")
        @@services = res.code == 200 ? res.parsed_response : nil
      end
      @@services
    end
    
    def self.services_regex
      if services.is_a?(Array)
        r = services.collect { |service| service['regex'].join('|') }.join('|')
        Regexp.new("^(#{r})$")
      end
    end
    
    protected
    
    def self.endpoint
      '/1/services/ruby'
    end
  end
end
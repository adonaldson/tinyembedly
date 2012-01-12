module Tinyembedly
  class ResponseError < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def to_s
      @response.inspect
    end
  end
end

require 'spec_helper'

describe Tinyembedly::Oembed do
  describe "params" do
    it "returns a hash containing the url and api key in the format Embedly expects" do
      oembed = Tinyembedly::Oembed.new(:url => 'url_placeholder', :api_key => 'fish')
      oembed.params[:url].should eq('url_placeholder')
      oembed.params[:key].should eq('fish')
    end
  end

  describe "get_oembed" do
    it "will call HTTParty's get method with the correct params" do
      oembed = Tinyembedly::Oembed.new
      oembed.stubs(:endpoint).returns('/endpoint')
      oembed.stubs(:params).returns('params_placeholder')
      Tinyembedly::Oembed.expects(:get).with('/endpoint', :query => 'params_placeholder')

      oembed.get_oembed
    end
  end

  describe "Oembed.api_key=" do
    it "will set the default Oembed API key" do
      Tinyembedly::Oembed.api_key = 'fish'
      oembed = Tinyembedly::Oembed.new
      oembed.api_key.should eq('fish')
    end
  end

  describe "to_hash" do
    it "when successful, will return a the response as a hash" do
      response = mock(:code => 200, :parsed_response => 'response_hash')

      oembed = Tinyembedly::Oembed.new
      oembed.expects(:get_oembed).once.returns(response)

      oembed.to_hash.should eq('response_hash')
    end

    it "when an HTTP error occurs, will raise a Tinyembedly::ResponseError" do
      response = mock(:code => 401)

      oembed = Tinyembedly::Oembed.new
      oembed.expects(:get_oembed).once.returns(response)

      lambda { oembed.to_hash }.should raise_error(Tinyembedly::ResponseError)
    end
  end

  describe "self.to_hash" do
    it "will instantiate the Oembed with the passed in url and call #to_hash" do
      oembed = mock(:to_hash => 'response_hash')
      Tinyembedly::Oembed.expects(:new).with({ :url => 'url_placeholder' }).returns(oembed)
      Tinyembedly::Oembed.to_hash('url_placeholder').should eq('response_hash')
    end
  end
end

require 'spec_helper'

describe Tinyembedly::Service do
  before(:each) do
    @base = Tinyembedly::Service
  end
  
  describe "list of services" do
    it "fetches list of services" do
      @base.expects(:get).with('http://api.embed.ly/1/services/ruby').returns(mock(:code => 0))
      @base.services
    end
    
    it "stores response" do
      services = [{'name' => 'youtube','regex' => []}]
      response = mock(:code => 200, :parsed_response => services)
      @base.expects(:get).returns(response)
      @base.services.size.should == 1
      @base.services.first['name'].should == 'youtube'
    end
  end
  
  describe "service regexes" do
    it "creates a regex" do
      @base.stubs(:services).returns([{'regex' => []}])
      @base.services_regex.should be_kind_of(Regexp)
    end
    
    it "returns nil when services missing" do
      @base.stubs(:services).returns(nil)
      @base.services_regex.should be_nil
    end
    
    it "collects regexes" do
      @base.stubs(:services).returns([
        {'regex' => ["http:\\/\\/.*youtube\\.com\\/watch.*","http:\\/\\/youtu\\.be\\/.*"]},
        {'regex' => ["http:\\/\\/military\\.discovery\\.com\\/videos\\/.*"]}])
      @base.services_regex.should == /^(http:\/\/.*youtube\.com\/watch.*|http:\/\/youtu\.be\/.*|http:\/\/military\.discovery\.com\/videos\/.*)$/
    end
  end
  
end
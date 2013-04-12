require 'selenium-webdriver'
require File.join(File.dirname(__FILE__),'../support/Setup')
require 'rspec'
require 'rspec/autorun'
require File.join(File.dirname(__FILE__),'../support/spec_helper')
require File.join(File.dirname(__FILE__),'../support/Helper')

describe "DeltaTest", :type => :selenium do

  it "should search for flights" do
    delta.home_page.queryFlight()
  end

end
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

  it "should list all the flight results and select one flight" do
    delta.flight_list_page.selectFlight
  end

  it "should display flight details page" do
     delta.flight_detail_page.submitPage
  end

  it "should fill passenger information " do
    delta.pax_info_page.fillAndsubmit
  end

  it "should fill payment information " do
    delta.payment_info_page.executePayment
  end

  it "should show booked PNR" do
    delta.confirmation_page.pnrGenerated
  end

end






























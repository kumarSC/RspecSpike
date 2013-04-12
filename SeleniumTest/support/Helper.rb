require_relative 'Setup'
require_relative 'sections'
require 'rspec/matchers'
require 'yaml'
require_relative 'data_helper'


class DeltaContainer
  include Sections

  def initialize(driver)
    @browser = driver
    @data_reader = DataReader.new

  end

  def data
    @data_reader
  end

end

class Delta < DeltaContainer
  def home_page
    @home_page = HomePage.new(@browser)
  end

  def flight_list_page
    @flight_list_page = FlightList.new(@browser)
  end

  def flight_detail_page
    @flight_detail_page = FlightDetails.new(@browser)
  end

  def pax_info_page
    @pax_info_page = PaxInfo.new(@browser)
  end

  def payment_info_page
    @payment_info_page = PaymentInfo.new(@browser)
  end

  def confirmation_page
    @confirmation_page = ConfirmationPage.new(@browser)
  end

end


class HomePage < DeltaContainer

  #attr_accessor :trip, :from, :to, :date


  def queryFlight()

    @browser.find_delta_element(:id, "#{sections["one_way"]}").click
    @browser.find_delta_element(:xpath, "#{sections["origin"]}").send_keys(data.origin)
    @browser.find_delta_element(:xpath, "#{sections["origin"]}").send_keys(:enter)
    @browser.find_delta_element(:id, "#{sections["destination"]}").send_keys(data.destination)
    @browser.find_delta_element(:id, "#{sections["destination"]}").send_keys(:enter)
    @browser.find_delta_element(:id, "#{sections["departure_date"]}").click
    if @browser.find_delta_element(:xpath, "#{sections["todays_date"]}").enabled?
      @browser.find_delta_element(:xpath, "#{sections["todays_date"]}").click
    end
    @browser.find_delta_element(:id, "#{sections["submit"]}").click
    wait.until {
      @browser.execute_script("return document.readyState;") == "complete"
    }
    next_page = FlightList.new(@browser)

  end
end

class FlightList < DeltaContainer

  def selectFlight

    wait.until {
      @browser[:class => "#{sections["select_flight"]}"].displayed?
    }
    @browser[:class=> "#{sections["select_flight"]}"].click
    wait_for_page_load

    next_page = FlightDetails.new(@browser)

  end

end

class FlightDetails < DeltaContainer
  def submitPage
    sleep 5
    @browser.execute_script("scroll(0,1000)")
    @browser.find_delta_element(:xpath, "#{sections["continue"]}").click
    wait_for_page_load
    next_page = PaxInfo.new(@browser)
  end

end


class PaxInfo < DeltaContainer

  def fillAndsubmit

    @browser.find_delta_element(:id, "#{sections["pax_first_name"]}").send_keys("delta")
    @browser.find_delta_element(:id, "#{sections["pax_last_name"]}").send_keys("user")
    @browser.find_delta_element(:id, "#{sections["gender"]}").send_keys("M")
    @browser.find_delta_element(:id, "#{sections["telephone"]}").send_keys("3245678212")
    @browser.find_delta_element(:id, "#{sections["dob_month"]}").send_keys("March")
    @browser.find_delta_element(:id, "#{sections["dob_day"]}").send_keys("16")
    @browser.find_delta_element(:id, "#{sections["dob_year"]}").send_keys("1984")
    @browser.find_delta_element(:id, "#{sections["email"]}").send_keys("a@b.com")
    @browser.find_delta_element(:id, "#{sections["verify_email"]}").send_keys("a@b.com")
    @browser.find_delta_element(:id, "#{sections["purchase"]}").submit
    wait_for_page_load

    next_page = PaymentInfo.new(@browser)
  end
end


class PaymentInfo < DeltaContainer

  def executePayment
    @browser.find_delta_element(:id, "#{sections["cc_first_name"]}").send_keys("delta")
    @browser.find_delta_element(:id, "#{sections["cc_last_name"]}").send_keys("user")
    @browser.find_delta_element(:id, "#{sections["credit_card_number"]}").send_keys("371010000000000")
    @browser.find_delta_element(:id, "#{sections["credit_card_expiry_month"]}").send_keys("4")
    @browser.find_delta_element(:id, "#{sections["credit_card_expiry_year"]}").send_keys("2015")
    @browser.find_delta_element(:id, "#{sections["security_code"]}").send_keys("1111")
    @browser.find_delta_element(:id, "#{sections["address"]}").send_keys("Test Address")
    @browser.find_delta_element(:id, "#{sections["city"]}").send_keys("Atlanta")
    @browser.find_delta_element(:id, "#{sections["state_province"]}").send_keys("GA")
    @browser.find_delta_element(:id, "#{sections["postal_code"]}").send_keys("30320")
    @browser.switch_to.frame "#{sections["trip_insurance_frame"]}"
    @browser.execute_script("document.getElementById('WASCInsuranceOfferOption2').checked = true")
    @browser.switch_to.default_content
    @browser.find_element(:id, "#{sections["purchase"]}").submit

    next_page = ConfirmationPage.new(@browser)
  end

end


class ConfirmationPage < DeltaContainer

  def pnrGenerated
    puts deltapnr.text
    deltapnr.text.should == "YOUR PURCHASE IS COMPLETE. THANKS FOR CHOOSING DELTA."
  end

  private

  def deltapnr
    @browser.find_delta_element(:id, "#{sections["purchase_confirmation"]}")
  end

end






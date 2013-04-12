require 'selenium-webdriver'
require 'yaml'
require 'ostruct'


$browsermap={"chrome" => :chrome, "firefox" => :firefox, }

class Setup

  def self.open_browser(driver, profile)
    if profile
      prof = $browsermap[driver].to_s
      prof.capitalize!
      browserProfile = Selenium::WebDriver.const_get(prof).const_get(:Profile).send(:new)
    end
    #@browser = Selenium::WebDriver.for :remote, :desired_capabilities => :chrome
    @browser = Selenium::WebDriver.for :chrome
  end
end


def wait_for_page_load
  wait.until {
    @browser.execute_script("return document.readyState;") == "complete"
  }
end


def clickAndwait(value)
  @browser.find_element(:xpath, "#{value}").click
  wait_for_page_load
end


class Selenium::WebDriver::Driver

  def find_delta_element(*args)
    how, what = extract_args(args)

    unless by = FINDERS[how.to_sym]
      raise ArgumentError, "cannot find element by #{how.inspect}"
    end
    x = bridge.find_element_by by, what.to_s, ref
    sleep 2
    x
  end

end



class DataReader

  def initialize
    @delta = YAML.load_file("/Users/sushant/RubymineProjects/DeltaSeleniumDemo/SeleniumTest/data/Delta.yml")
  end

  def origin
    @delta["searchcriteria"]["origin"]
  end

  def destination
    @delta["searchcriteria"]["destination"]
  end

end












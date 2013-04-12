require 'selenium-client'
require 'selenium/rspec/spec_helper'

RSpec.configure do |config|

config.failure_color = :red
config.success_color = :green
config.pending_color = :green
config.detail_color = :cyan
config.tty = true
config.color = true


  def wait
    Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def delta
     Delta.new(@browser)
  end

  config.before(:all) do
    @browser = Setup.open_browser("chrome", "default")
    @browser.navigate.to "http://si.delta.com"
    wait.until { @browser.find_delta_element(:id => 'TB_iframeContent') }
    @browser.switch_to.frame "TB_iframeContent"
    clickAndwait('//*[@id="us"]/ul/li[1]/a')
    @browser.manage.timeouts.implicit_wait=10
    @browser.navigate.refresh
    wait.until { @browser.find_delta_element(:id, 'nav-widget-booking') }

  end

  config.after(:all) do
    @browser.quit
  end

end
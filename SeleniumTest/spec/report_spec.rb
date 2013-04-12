require "rspec/core/rake_task"
#require 'nokogiri'
#require 'lorax'

describe "Report" do
  it "Generates a clean report" do
    RSpec::Core::RakeTask.new(:test_for_specs) do |t|
      t.pattern = File.expand_path(File.dirname(__FILE__) + "/Delta.rb")
      t.rspec_opts = "--require 'selenium/rspec/reporting/selenium_test_report_formatter' "
      t.rspec_opts << "--require 'selenium/rspec/spec_helper' "
      t.rspec_opts << "--format SeleniumTestReportFormatter "
      t.rspec_opts << "-o ./spec_test_report.html"
      t.verbose = false
    end
    Rake::Task[:test_for_specs].invoke rescue nil
  end
end







































    #Rake::Task[:test_for_specs].invoke rescue nil
    #out = File.read(File.expand_path(File.dirname(__FILE__) + "/spec_test_report.html")).to_s
    #out.gsub! /\d+\.\d+ seconds/, 'x seconds'
    #out.match /Delta([a-z0-9]+)_snapshot/
    #reporting_uid = $1
    #puts reporting_uid
    #2.times{out.gsub! reporting_uid.to_s, "Failed"}
    #expected =  File.read(File.expand_path(File.dirname(__FILE__) + "/spec_results_for_comparison.html")).to_s
    #STDOUT.puts "The reporting_uid was #{reporting_uid}"
    #out.should == expected
    #%x{ }

    #compareReport = Nokogiri::HTML::Document.new
    #resultDiff = Lorax.diff(out,expected)
    #compareReport = resultDiff.apply(out)
    ##
    #buffer = File.open('compareReport.html','r').read
    #doc = Nokogiri::XML(buffer)
    #File.open('deltaDiff.html','w') {|f| doc.write_html_to f}


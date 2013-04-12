require 'ostruct'

delta = YAML.load_file("/Users/sushant/RubymineProjects/DeltaSeleniumDemo/SeleniumTest/data/Delta.yml")

deltadata = OpenStruct.new
deltadata.origin = delta["searchcriteria"]["origin"]
deltadata.destination = delta["searchcriteria"]["destination"]

require 'rubygems'
require 'factory_girl'

# Load config.yml
require_relative './config_helper'

# Load gem files
require_relative '../lib/rhapsody/models/client'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include ConfigHelper
end

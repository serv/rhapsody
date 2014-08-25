require 'rubygems'
require 'factory_girl'

# Load config.yml
require_relative './config_helper'

# Load helpers
require_relative './helpers/authentication_helper'

# Load gem files
require_relative '../lib/rhapsody/controllers/clients_controller'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include ConfigHelper
  config.include AuthenticationHelper
end

require 'rubygems'
require 'factory_girl'

require_relative '../lib/rhapsody/models/client'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

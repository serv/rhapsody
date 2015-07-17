$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rhapsody'
require 'byebug'
require 'capybara/rspec'

# Load config.yml
require_relative './config_helper'

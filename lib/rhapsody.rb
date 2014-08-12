require "rhapsody/version"

require 'rhapsody/helpers/faraday_connection'

require 'rhapsody/controllers/clients_controller'
require 'rhapsody/controllers/members_controller'

require 'rhapsody/models/member'

module Rhapsody
  HOST_URL = 'https://api.rhapsody.com'
end

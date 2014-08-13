module Rhapsody::FaradayConnection
  require 'faraday'

  def self.prepare_authentication
    Faraday.new(:url => Rhapsody::HOST_URL) do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.prepare_authorization(access_token)
    Faraday.new(:url => Rhapsody::HOST_URL) do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
      faraday.authorization :Bearer, access_token
    end
  end
end

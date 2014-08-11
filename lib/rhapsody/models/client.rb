class Rhapsody::Client
  attr_accessor :api_key,
                :api_secret,
                :auth_code,
                :redirect_url,
                :raw_reponse,
                :json_response,
                :response_status,
                :access_token,
                :refresh_token,
                :expires_in

  class << self
  end

  def initialize(options)
    @api_key = options[:api_key]
    @api_secret = options[:api_secret]
    @auth_code = options[:auth_code]
    @redirect_url = options[:redirect_url]
  end

  def connect
    host_url = 'https://api.rhapsody.com'
    oauth_path = '/oauth/access_token'

    connection = Faraday.new(:url => host_url) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    post_hash = {
      client_id: @api_key,
      client_secret: @api_secret,
      response_type: 'code',
      grant_type: 'authorization_code',
      code: @auth_code,
      redirect_uri: @redirect_url
    }

    @raw_response = connection.post(oauth_path, post_hash)
    @json_response = JSON.parse(@raw_response.env[:body])
    @response_status = @raw_response.env[:status]

    @access_token = @json_response['access_token']
    @refresh_token = @json_response['refresh_token']
    @expires_in = @json_response['expires_in']
  end
end

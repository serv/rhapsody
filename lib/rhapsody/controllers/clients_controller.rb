class Rhapsody::ClientsController
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

  OAUTH_PATH = '/oauth/access_token'

  def initialize(options)
    options.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end

  def connect
    connection = Rhapsody::FaradayConnection.prepare_authentication

    post_hash = {
      client_id: @api_key,
      client_secret: @api_secret,
      response_type: 'code',
      grant_type: 'authorization_code',
      code: @auth_code,
      redirect_uri: @redirect_url
    }

    @raw_response = connection.post(OAUTH_PATH, post_hash)
    @json_response = JSON.parse(@raw_response.env[:body])
    @response_status = @raw_response.env[:status]

    @access_token = @json_response['access_token']
    @refresh_token = @json_response['refresh_token']
    @expires_in = @json_response['expires_in']
    self
  end

  def renew
    conneciton = Rhapsody::FaradayConnection.prepare_authentication

    post_hash = {
      client_id: @api_key,
      client_secret: @api_secret,
      response_type: 'code',
      grant_type: 'refresh_token',
      refresh_token: @refresh_token
    }

    @raw_response = connection.post(OAUTH_PATH, post_hash)
    @json_response = JSON.parse(@raw_response.env[:body])
    @response_status = @raw_response.env[:status]

    @access_token = @json_response['access_token']
    @refresh_token = @json_response['refresh_token']
    @expires_in = @json_response['expires_in']
    self
  end

  def me_account
    options = { access_token: @access_token }
    members_controller = Rhapsody::MembersController.new(options)
    member = members_controller.account
  end
end

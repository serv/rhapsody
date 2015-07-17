class Rhapsody::Authentication
  attr_accessor :client,
                :access_token,
                :refresh_token,
                :expires_in

  def initialize(options)
    options.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end

  def password_grant
    request_hash = {
      api_key: @client.api_key,
      api_secret: @client.api_secret
    }
    request = Rhapsody::Request.new(request_hash)

    post_hash = {
      response_type: 'code',
      grant_type: 'password',
      username: @client.username,
      password: @client.password
    }
    raw_response = request.faraday.post('/oauth/token', post_hash)
    body = Oj.load(raw_response.body)

    @access_token = body['access_token']
    @refresh_token = body['refresh_token']
    @expires_in = body['expires_in'].to_i

    self
  end

  def connect
    request = Rhapsody::Request.new({})

    post_hash = {
      client_id: @client.api_key,
      client_secret: @client.api_secret,
      response_type: 'code',
      grant_type: 'authorization_code',
      code: @client.auth_code,
      redirect_uri: @client.redirect_uri
    }

    raw_response = request.faraday.post('oauth/access_token', post_hash)
    body = Oj.load(raw_response.body)

    @access_token = body['access_token']
    @refresh_token = body['refresh_token']
    @expires_in = body['expires_in'].to_i

    self
  end

  def renew
    request = Rhapsody::Request.new({})

    post_hash = {
      client_id: @client.api_key,
      client_secret: @client.api_secret,
      response_type: 'code',
      grant_type: 'refresh_token',
      refresh_token: @refresh_token
    }

    raw_response = request.faraday.post('oauth/access_token', post_hash)
    body = Oj.load(raw_response.body)

    @access_token = body['access_token']
    @refresh_token = body['refresh_token']
    @expires_in = body['expires_in'].to_i

    self
  end
end

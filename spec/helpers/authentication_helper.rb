require 'json'

module AuthenticationHelper

  # using password grant get an access token
  def AuthenticationHelper.get_access_token
    oauth_path = 'https://api.rhapsody.com/oauth/token'
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']
    api_key = config_variables['API_KEY']
    api_secret = config_variables['API_SECRET']
    username = config_variables['USERNAME']
    password = config_variables['PASSWORD']

    connection = Faraday.new(:url => Rhapsody::HOST_URL) do |faraday|
      faraday.request  :url_encoded
      faraday.basic_auth(api_key, api_secret)
      faraday.adapter  Faraday.default_adapter
    end

    post_hash = {
      username: username,
      password: password,
      grant_type: 'password'
    }

    raw_response = connection.post(oauth_path, post_hash)
    json_response = JSON.parse(raw_response.env[:body])
    access_token = json_response['access_token']
  end

  def AuthenticationHelper.get_connected_client
    oauth_path = 'https://api.rhapsody.com/oauth/token'
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']
    api_key = config_variables['API_KEY']
    api_secret = config_variables['API_SECRET']
    username = config_variables['USERNAME']
    password = config_variables['PASSWORD']

    connection = Faraday.new(:url => Rhapsody::HOST_URL) do |faraday|
      faraday.request  :url_encoded
      faraday.basic_auth(api_key, api_secret)
      faraday.adapter  Faraday.default_adapter
    end

    post_hash = {
      username: username,
      password: password,
      grant_type: 'password'
    }

    raw_response = connection.post(oauth_path, post_hash)
    json_response = JSON.parse(raw_response.env[:body])

    client = Rhapsody::ClientsController.new({
      api_key: config_variables['API_KEY'],
      api_secret: config_variables['API_SECRET'],
      access_token: json_response['access_token'],
      refresh_token: json_response['refresh_token']
    })
  end

  # typical post hash
  def AuthenticationHelper.post_hash
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']
    api_key = config_variables['API_KEY']
    api_secret = config_variables['API_SECRET']

    options = {
      api_key: api_key,
      api_secret: api_secret,
      auth_code: 'fakeauthcode',
      redirect_url: 'http://api.soundtracking.dev:3000/auth/rhapsody/authorize'
    }
  end
end

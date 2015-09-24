require 'spec_helper'
require 'oj'
require 'uri'
require 'cgi'
require 'uuid'

describe Rhapsody::Client do
  it 'has a class' do
    expect(Rhapsody::Client).not_to be nil
  end

  it '.initialize' do
    client = Rhapsody::Client.new({api_key: 'key', api_secret: 'secret'})

    expect(client).to respond_to('api_key')
    expect(client).to respond_to('api_secret')
    expect(client).to respond_to('redirect_uri')
    expect(client).to respond_to('username')
    expect(client).to respond_to('password')
    expect(client).to respond_to('state')
    expect(client).to respond_to('auth_code')
    expect(client).to respond_to('authentication')

    expect(client.api_key).to eql('key')
    expect(client.api_secret).to eql('secret')
  end

  it '#authorization_url' do
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']

    client_hash = {
      api_key: config_variables['API_KEY'],
      api_secret: config_variables['API_SECRET'],
      redirect_uri: config_variables['REDIRECT_URI']
    }

    client = Rhapsody::Client.new(client_hash)
    expected_url = "https://api.rhapsody.com/oauth/authorize?client_id=#{client_hash[:api_key]}&redirect_uri=#{client_hash[:redirect_uri]}&response_type=code"

    expect(client.authorization_url).to eql(expected_url)
  end

  describe 'oauth flow', type: :feature, js: true do
    it '#connect' do
      yaml = ConfigHelper.load
      config_variables = yaml['config_variables']
      state = UUID.new.generate

      client_hash = {
        api_key: config_variables['API_KEY'],
        api_secret: config_variables['API_SECRET'],
        redirect_uri: config_variables['REDIRECT_URI'],
        state: state
      }

      client = Rhapsody::Client.new(client_hash)

      visit client.authorization_url
      within(".form-horizontal") do
        fill_in 'Username', with: config_variables['USERNAME']
        fill_in 'Password', with: config_variables['PASSWORD']
      end
      click_button 'Sign In'

      redirect_uri = page.find('.btn.btn-primary.btn-warning.pull-right')['href']
      client.auth_code = CGI.parse(URI.parse(redirect_uri).query)['code'].first
      client.state = CGI.parse(URI.parse(redirect_uri).query)['state'].first

      # Ensure that state remained the same during the OAuth 2 flow
      expect(client.state).to eql(state)

      authentication = client.connect

      expect(authentication.access_token).not_to eql(nil)
      expect(authentication.refresh_token).not_to eql(nil)
      expect(authentication.expires_in).not_to eql(nil)
      expect(authentication.access_token).to eql(client.authentication.access_token)
      expect(authentication.refresh_token).to eql(client.authentication.refresh_token)
      expect(authentication.expires_in).to eql(client.authentication.expires_in)
    end
  end

  it '#password_grant' do
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']

    client_hash = {
      api_key: config_variables['API_KEY'],
      api_secret: config_variables['API_SECRET'],
      username: config_variables['USERNAME'],
      password: config_variables['PASSWORD']
    }

    client = Rhapsody::Client.new(client_hash)
    authentication = client.password_grant

    expect(authentication.access_token).not_to eql(nil)
    expect(authentication.refresh_token).not_to eql(nil)
    expect(authentication.expires_in).not_to eql(nil)
    expect(authentication.access_token).to eql(client.authentication.access_token)
    expect(authentication.refresh_token).to eql(client.authentication.refresh_token)
    expect(authentication.expires_in).to eql(client.authentication.expires_in)
  end

  it '#renew' do
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']

    client_hash = {
      api_key: config_variables['API_KEY'],
      api_secret: config_variables['API_SECRET'],
      username: config_variables['USERNAME'],
      password: config_variables['PASSWORD']
    }

    client = Rhapsody::Client.new(client_hash)
    client.password_grant

    old_access_token = client.authentication.access_token

    client.renew

    expect(old_access_token).not_to eql(client.authentication.access_token)
  end
end

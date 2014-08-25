require 'spec_helper'

describe Rhapsody do
  it 'loads spec/config.yml' do
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']

    expect(config_variables).not_to be_empty
    expect(config_variables['API_KEY'].length).not_to eql(0)
    expect(config_variables['API_SECRET'].length).not_to eql(0)
    expect(config_variables['USERNAME'].length).not_to eql(0)
    expect(config_variables['PASSWORD'].length).not_to eql(0)
  end

  it 'checks version' do
    expect(Rhapsody::VERSION).to eql('0.0.7')
  end

  it 'has a helper for getting an access token' do
    expect(AuthenticationHelper.get_access_token).not_to eql(0)
  end
end

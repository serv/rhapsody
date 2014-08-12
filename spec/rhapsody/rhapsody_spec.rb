require 'spec_helper'

describe Rhapsody do
  it 'loads spec/config.yml' do
    yaml = ConfigHelper.load
    config_variables = yaml['config_variables']

    expect(config_variables).not_to be_empty
    expect(config_variables['API_KEY'].length).not_to eql(0)
    expect(config_variables['API_SECRET'].length).not_to eql(0)
  end

  it 'checks version' do
    expect(Rhapsody::VERSION).to eql('0.0.6.beta2')
  end
end

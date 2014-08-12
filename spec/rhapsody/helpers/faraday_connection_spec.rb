require 'spec_helper'

describe Rhapsody::FaradayConnection do
  it '#prepare_authentication' do
    faraday_obj = Rhapsody::FaradayConnection.prepare_authentication
    expect(faraday_obj.class.name).to eql('Faraday::Connection')
  end

  it '#prepare_authorization' do
    faraday_obj = Rhapsody::FaradayConnection.prepare_authorization('fake')
    expect(faraday_obj.class.name).to eql('Faraday::Connection')
  end
end

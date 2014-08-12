require 'spec_helper'

describe Rhapsody::ClientsController do
  it 'has HOST_URL' do
    host_url = Rhapsody::HOST_URL
    expect(host_url).to eql('https://api.rhapsody.com')
  end
end

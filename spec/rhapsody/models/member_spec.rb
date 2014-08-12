require 'spec_helper'

describe Rhapsody::Client do
  it 'has HOST_URL' do
    host_url = Rhapsody::HOST_URL
    expect(host_url).to eql('https://api.rhapsody.com')
  end

  it '.new' do
  end

  it '#account' do
  end
end

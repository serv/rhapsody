require 'spec_helper'

describe Rhapsody::API, '#version' do
  it "returns a string" do
    version = Rhapsody::API.version
    version.class.name.should == "String"
  end
  
  it "returns first character as v" do
    version = Rhapsody::API.version
    version[0].should == 'v'
  end
end

describe Rhapsody::API, '#base' do
  it 'returns a base url for api call' do
    Rhapsody::API.base.should == "http://api.rhapsody.com/"
  end
end

describe Rhapsody::API, '#base_v' do
  it 'returns a base version url for api call' do
    base_v = Rhapsody::API.base + Rhapsody::API.version + '/'
  end
end

describe Rhapsody::API, '#full_url' do
  it 'returns a full url for api call' do
    full = Rhapsody::API.full_url(Rhapsody::Album.name)
    full.should == 'http://api.rhapsody.com/v1/albums/'
  end
end
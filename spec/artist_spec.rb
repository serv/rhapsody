require 'spec_helper'

describe Rhapsody::Artist, '#initialize' do
  it "returns an artist object" do
    album = Rhapsody::Artist.new({})
    album.class.name.should == "Rhapsody::Artist"
  end

  it "responds to all the artist attributes" do
    album = Rhapsody::Artist.new({})
    album_attributes = [:id, :name, :genre]

    album_attributes.each do |attribute|
      album.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of artist" do
    album = Rhapsody::Artist.new({
      :id => "Art.954",
      :name => "Weezer",
      :genre => Rhapsody::Genre.new({:id => "g.397"})
    })

    album.id.should == "Art.954"
    album.name.should == "Weezer"
    album.genre.id.should == "g.397"
  end
end
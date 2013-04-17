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

describe Rhapsody::Artist, '#top_artists' do
  it 'returns an array' do
    artists = Rhapsody::Artist.top_artists(nil, nil)
    artists.class.name.should == "Array"
  end

  it 'should have artists as elements' do
    artists = Rhapsody::Artist.top_artists(nil, nil)
    artists.each do |artist|
      artist.class.name.should == "Rhapsody::Artist"
    end
  end

  it 'should grab the same number as the limit' do
    random_number = rand(10)+1
    artists = Rhapsody::Artist.top_artists(random_number, nil)
    artists.count.should == random_number
  end

  it 'should offset by the right number' do
    offset = rand(5)+1
    limit = offset + rand(5)+1

    no_offset_artists = Rhapsody::Artist.top_artists(limit, nil)
    offset_artists = Rhapsody::Artist.top_artists(limit, offset)

    no_offset_artists_ids = no_offset_artists.map {|a| a.id }
    offset_artists_ids = offset_artists.map {|a| a.id }

    (no_offset_artists_ids & offset_artists_ids).count.should == limit-offset
  end
end

describe Rhapsody::Artist, '#artist_detail_simple' do
  it 'returns an artist object' do
    artist = Rhapsody::Artist.artist_detail_simple('art.954')
    artist.class.name.should == 'Rhapsody::Artist'
  end
end

describe Rhapsody::Artist, '#artist_detail_full' do
  it 'returns an artist object' do
    artist = Rhapsody::Artist.artist_detail_full('art.954')
    artist.class.name.should == 'Rhapsody::Artist'
  end

  it 'should have an array of albums' do
    artist = Rhapsody::Artist.artist_detail_full('art.954')
    artist.albums.class.name.should == 'Array'
    artist.albums.each do |album|
      album.class.name.should == "Rhapsody::Album"
    end
  end
end

describe Rhapsody::Artist, '#artist_discography' do
  it 'returns an array of albums' do
    albums = Rhapsody::Artist.artist_discography('art.954')
    albums.class.name.should == 'Array'
    albums.each do |album|
      album.class.name.should == "Rhapsody::Album"
    end
  end
end
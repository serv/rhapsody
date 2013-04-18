require 'spec_helper'

describe Rhapsody::Artist, '#initialize' do
  it "returns an artist object" do
    artist = Rhapsody::Artist.new({})
    artist.class.name.should == "Rhapsody::Artist"
  end

  it "responds to all the artist attributes" do
    artist = Rhapsody::Artist.new({})
    artist_attributes = [:id, :name, :genre]

    artist_attributes.each do |attribute|
      artist.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of artist" do
    artist = Rhapsody::Artist.new({
      :id => "Art.954",
      :name => "Weezer",
      :genre => Rhapsody::Genre.new({:id => "g.397"})
    })

    artist.id.should == "Art.954"
    artist.name.should == "Weezer"
    artist.genre.id.should == "g.397"
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

describe Rhapsody::Artist, '#bio_blurb' do
  it 'returns an bio object' do
    bio = Rhapsody::Artist.bio_blurb('art.954')
    bio.class.name.should == 'Rhapsody::Bio'
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

describe Rhapsody::Artist, '#top_albums' do
  it 'returns an array of albums' do
    albums = Rhapsody::Artist.top_albums('art.954', nil, nil)
    albums.class.name.should == 'Array'
    albums.each do |album|
      album.class.name.should == 'Rhapsody::Album'
    end
  end

  it 'should grab the same number as the limit' do
    random_number = rand(10)+1
    albums = Rhapsody::Artist.top_albums('art.954', random_number, nil)
    albums.count.should == random_number
  end

  it 'should offset by the right number' do
    offset = rand(5)+1
    limit = offset + rand(5)+1

    no_offset_artists = Rhapsody::Artist.top_albums('art.954', limit, nil)
    offset_artists = Rhapsody::Artist.top_albums('art.954', limit, offset)

    no_offset_artists_ids = no_offset_artists.map {|a| a.id }
    offset_artists_ids = offset_artists.map {|a| a.id }

    (no_offset_artists_ids & offset_artists_ids).count.should == limit-offset
  end
end

describe Rhapsody::Artist, '#top_tracks' do
  it 'returns an array of tracks' do
    tracks = Rhapsody::Artist.top_tracks('art.954', nil, nil)
    tracks.class.name.should == 'Array'
    tracks.each do |track|
      track.class.name.should == 'Rhapsody::Track'
    end
  end

  it 'should grab the same number as the limit' do
    random_number = rand(10)+1
    tracks = Rhapsody::Artist.top_tracks('art.954', random_number, nil)
    tracks.count.should == random_number
  end

  it 'should offset by the right number' do
    offset = rand(5)+1
    limit = offset + rand(5)+1

    no_offset_artists = Rhapsody::Artist.top_tracks('art.954', limit, nil)
    offset_artists = Rhapsody::Artist.top_tracks('art.954', limit, offset)

    no_offset_artists_ids = no_offset_artists.map {|a| a.id }
    offset_artists_ids = offset_artists.map {|a| a.id }

    (no_offset_artists_ids & offset_artists_ids).count.should == limit-offset
  end
end

describe Rhapsody::Artist, '#images' do
  it 'returns an array of images' do
    images = Rhapsody::Artist.images('art.954')
    images.class.name.should == 'Array'

    images.each do |image|
      image.class.name.should == 'Rhapsody::Image'
    end
  end
end

describe Rhapsody::Artist, '#similar_artists' do
  it 'returns an array of artists' do
    artists = Rhapsody::Artist.similar_artists('art.954')
    artists.class.name.should == 'Array'

    artists.each do |artist|
      artist.class.name.should == 'Rhapsody::Artist'
    end
  end
end

describe Rhapsody::Artist, '#editorial_features' do
  it 'returns an array of features' do
    features = Rhapsody::Artist.editorial_features('art.954')
    features.class.name.should == 'Array'

    features.each do |feature|
      feature.class.name.should == 'Rhapsody::Feature'
    end
  end
end
require 'spec_helper'

describe Rhapsody::Genre, '#initialize' do
  it "returns an Genre object" do
    genre = Rhapsody::Genre.new({})
    genre.class.name.should == "Rhapsody::Genre"
  end

  it "responds to all the genre attributes" do
    genre = Rhapsody::Genre.new({})
    genre_attributes = [:id]

    genre_attributes.each do |attribute|
      genre.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of genre" do
    genre = Rhapsody::Genre.new({
      :id => "g.397"
    })

    genre.id.should == "g.397"
  end
end

describe Rhapsody::Genre, '#tree' do
  it 'returns an array' do
    tree = Rhapsody::Genre.tree
    tree.class.name.should == 'Array'
  end

  it 'should contain genre in the array' do
    tree = Rhapsody::Genre.tree
    tree.each do |genre|
      genre.class.name.should == 'Rhapsody::Genre'
    end
  end
end

describe Rhapsody::Genre, '#detail' do
  it 'returns a genre object' do
    genre = Rhapsody::Genre.detail('g.397')
    genre.class.name.should == 'Rhapsody::Genre'
  end
end

describe Rhapsody::Genre, '#new_releases_by_genre' do
  it 'returns an array of albums' do
    albums = Rhapsody::Genre.new_releases_by_genre('g.397')
    albums.class.name.should == 'Array'
    albums.each do |alb|
      alb.class.name.should == 'Rhapsody::Album'
    end
  end
end

describe Rhapsody::Genre, '#top_artists' do
  it 'returns an array of artists' do
    artists = Rhapsody::Genre.top_artists('g.397', nil, nil)
    artists.class.name.should == 'Array'
    artists.each do |art|
      art.class.name.should == 'Rhapsody::Artist'
    end
  end

  it 'should grab the same number as the limit' do
    random_number = rand(4)+1
    artists = Rhapsody::Genre.top_artists('g.397', random_number, nil)
    artists.count.should == random_number
  end

  it 'should offset by the right number' do
    offset = rand(3)+1
    limit = offset + rand(3)+1

    no_offset_artists = Rhapsody::Genre.top_artists('g.397', limit, nil)
    offset_artists = Rhapsody::Genre.top_artists('g.397', limit, offset)

    no_offset_artists_ids = no_offset_artists.map {|a| a.id }
    offset_artists_ids = offset_artists.map {|a| a.id }

    (no_offset_artists_ids & offset_artists_ids).count.should == limit-offset
  end
end

describe Rhapsody::Genre, '#top_albums' do
  it 'returns an array of albums' do
    albums = Rhapsody::Genre.top_albums('g.397', nil, nil)
    albums.class.name.should == 'Array'
    albums.each do |art|
      art.class.name.should == 'Rhapsody::Artist'
    end
  end

  it 'should grab the same number as the limit' do
    random_number = rand(4)+1
    albums = Rhapsody::Genre.top_albums('g.397', random_number, nil)
    albums.count.should == random_number
  end

  it 'should offset by the right number' do
    offset = rand(3)+1
    limit = offset + rand(3)+1

    no_offset_albums = Rhapsody::Genre.top_albums('g.397', limit, nil)
    offset_albums = Rhapsody::Genre.top_albums('g.397', limit, offset)

    no_offset_albums_ids = no_offset_albums.map {|a| a.id }
    offset_albums_ids = offset_albums.map {|a| a.id }

    (no_offset_albums_ids & offset_albums_ids).count.should == limit-offset
  end
end

describe Rhapsody::Genre, '#programmed_radio_stations' do
  it 'returns an array of radio' do
    radios = Rhapsody::Genre.programmed_radio_stations('g.397')

    radios.class.name.should == 'Array'
    radios.each do |radio|
      radio.class.name.should == 'Rhapsody::Radio'
    end
  end
end
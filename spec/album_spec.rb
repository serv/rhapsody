require 'spec_helper'

describe Rhapsody::Album, '#initialize' do
  it "retuns an album object" do
    album = Rhapsody::Album.new({})
    album.class.name.should == "Rhapsody::Album"
  end

  it "responds to all the album attributes" do
    album = Rhapsody::Album.new({})
    album_attributes = [:id, :name, :artist, :released, :tags, :label, :discs, :genre, :type, :copyright, :images, :tracks]

    album_attributes.each do |attribute|
      album.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of album" do
    album = Rhapsody::Album.new({
      :id => "Alb.96825681",
      :name => "I Am Not A Human Being II",
      :artist => Rhapsody::Artist.new({:id => "Art.9005", :name => "Lil Wayne"}),
      :released => 1364281200000,
      :tags => ["Explicit"],
      :label => nil,
      :discs => 1,
      :genre => nil,
      :type => {"id"=>0, "name"=>"Main Releases"},
      :copyright => nil,
      :images => [{"width"=>170, "height"=>170, "url"=>"http://static.rhap.com/img/170x170/9/2/4/3/3923429_170x170.jpg"}],
      :tracks => nil
    })

    album.id.should == "Alb.96825681"
    album.name.should == "I Am Not A Human Being II"
    album.artist.id.should == "Art.9005"
    album.artist.name.should == "Lil Wayne"
    album.released.should == 1364281200000
    album.type.should == {"id"=>0, "name"=>"Main Releases"}
    album.tags.should == ["Explicit"]
    album.images.should == [{"width"=>170, "height"=>170, "url"=>"http://static.rhap.com/img/170x170/9/2/4/3/3923429_170x170.jpg"}]
  end
end

describe Rhapsody::Album, '#top' do
  it "returns 'limit' number of albums" do
    random_number = rand(10) + 1
    albums = Rhapsody::Album.top(random_number, nil)
    albums.count.should == random_number
  end

  it "offsets the right number of offset" do
    total = 10
    offset = 5
    total_albums = Rhapsody::Album.top(total, nil)
    offset_albums = Rhapsody::Album.top(total, offset)

    total_albums.count.should == total
    offset_albums.count.should == total

    total_albums_ids_only = total_albums.map {|x| x.id }
    offset_albums_ids_only = offset_albums.map {|x| x.id }

    (total_albums_ids_only & offset_albums_ids_only).count.should == offset
  end
end

describe Rhapsody::Album, '#album_details' do
  it "returns a album object and have correct attributes" do
    album_attributes = [:id, :name, :artist, :released, :tags, :label, :discs, :genre, :type, :copyright, :images, :tracks]
    
    album = Rhapsody::Album.album_details("alb.42020471")
    album.class.name.should == "Rhapsody::Album"
    album.tracks.each do |track|
      track.class.name.should == "Rhapsody::Track"
    end
    album_attributes.each do |attribute|
      album.respond_to?(attribute).should == true
    end
  end
end

describe Rhapsody::Album, '#new_releases' do
  it "returns an array of albums" do    
    albums = Rhapsody::Album.new_releases
    albums.class.name.should == "Array"
    albums.each do |album|
      album.class.name.should == "Rhapsody::Album"
    end
  end
end


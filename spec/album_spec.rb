require 'spec_helper'

describe Rhapsody::Album, '#initialize' do
  it "retuns an album object" do
    album = Rhapsody::Album.new(nil, nil, nil, nil, nil, nil, nil)
    album.class.name.should == "Rhapsody::Album"
  end

  it "can initialize values for attributes of album" do
    album = Rhapsody::Album.new("Alb.96825681", "I Am Not A Human Being II" , {"id"=>"Art.9005", "name"=>"Lil Wayne"}, 1364281200000, {"id"=>0, "name"=>"Main Releases"} , ["Explicit"] , [{"width"=>170, "height"=>170, "url"=>"http://static.rhap.com/img/170x170/9/2/4/3/3923429_170x170.jpg"}])
    album.id.should == "Alb.96825681"
    album.name.should == "I Am Not A Human Being II"
    album.artist.should == {"id"=>"Art.9005", "name"=>"Lil Wayne"}
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
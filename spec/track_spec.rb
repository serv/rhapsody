require 'spec_helper'

describe Rhapsody::Track, '#initialize' do
  it "returns an Track object" do
    track = Rhapsody::Track.new({})
    track.class.name.should == "Rhapsody::Track"
  end

  it "responds to all the track attributes" do
    track = Rhapsody::Track.new({})
    track_attributes = [:id, :name, :artist, :album, :genre, :duration, :sample]

    track_attributes.each do |attribute|
      track.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of track" do
    track = Rhapsody::Track.new({
      :id => "Tra.42020472",
      :name => "Tired Of Sex",
      :artist => Rhapsody::Artist.new({"id" => "Art.954", "name" => "Weezer"}),
      :album => Rhapsody::Album.new({"id" => "Alb.42020471", "name" => "Pinkerton - Deluxe Edition"}),
      :genre => Rhapsody::Genre.new({"id" => "g.397"}),
      :duration => 181,
      :sample => "http://listen.vo.llnwd.net/g2/6/4/9/7/9/899997946.mp3"
    })

    track.id.should == "Tra.42020472"
    track.name.should == "Tired Of Sex"
    track.artist.id.should == "Art.954"
    track.artist.name.should == "Weezer"
    track.album.id.should == "Alb.42020471"
    track.album.name.should == "Pinkerton - Deluxe Edition"
    track.genre.id.should == "g.397"
    track.duration.should == 181
    track.sample.should == "http://listen.vo.llnwd.net/g2/6/4/9/7/9/899997946.mp3"
  end
end

describe Rhapsody::Track, '#details' do
  it 'returns an Track object' do
    track = Rhapsody::Track.details('tra.5156528')
    track.class.name.should == 'Rhapsody::Track'
  end
end
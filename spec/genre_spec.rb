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
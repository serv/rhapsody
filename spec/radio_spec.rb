require 'spec_helper'

describe Rhapsody::Radio, '#initialize' do
  it "returns an Radio object" do
    genre = Rhapsody::Radio.new({})
    genre.class.name.should == "Rhapsody::Radio"
  end

  it "responds to all the genre attributes" do
    genre = Rhapsody::Radio.new({})
    genre_attributes = [:id, :name, :artists,
      :summary, :description, :images]

    genre_attributes.each do |attribute|
      genre.respond_to?(attribute).should == true
    end
  end
end
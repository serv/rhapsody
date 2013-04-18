require 'spec_helper'

describe Rhapsody::Bio, '#initialize' do
  it "returns an bio object" do
    bio = Rhapsody::Bio.new({})
    bio.class.name.should == "Rhapsody::Bio"
  end

  it "responds to all the bio attributes" do
    bio = Rhapsody::Bio.new({})
    bio_attributes = [:bio, :blurb]

    bio_attributes.each do |attribute|
      bio.respond_to?(attribute).should == true
    end
  end
end
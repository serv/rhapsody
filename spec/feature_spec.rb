require 'spec_helper'

describe Rhapsody::Feature do
  it "returns an feature object" do
    feature = Rhapsody::Feature.new({})
    feature.class.name.should == "Rhapsody::Feature"
  end

  it "responds to all the feature attributes" do
    feature = Rhapsody::Feature.new({})
    feature_attributes = [:postId, :type, :title, :author,
      :date, :image, :primaryMedia, :content, :playlists,
      :albums, :tracks, :stations, :posts, :related
    ]

    feature_attributes.each do |attribute|
      feature.respond_to?(attribute).should == true
    end
  end
end


require 'spec_helper'

describe Rhapsody::Review, '#initialize' do
  it "returns an Review object" do
    review = Rhapsody::Review.new({})
    review.class.name.should == "Rhapsody::Review"
  end

  it "responds to all the review attributes" do
    review = Rhapsody::Review.new({})
    review_attributes = [:id]

    review_attributes.each do |attribute|
      review.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of review" do
    review = Rhapsody::Review.new({
      :id => "g.397"
    })

    review.id.should == "g.397"
  end
end
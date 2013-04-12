require 'spec_helper'

describe Rhapsody::Image, '#initialize' do
  it "returns an Image object" do
    image = Rhapsody::Image.new({})
    image.class.name.should == "Rhapsody::Image"
  end

  it "responds to all the image attributes" do
    image = Rhapsody::Image.new({})
    image_attributes = [:width, :height, :url]

    image_attributes.each do |attribute|
      image.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of image" do
    image = Rhapsody::Image.new({
      :width => 170,
      :height => 170,
      :url => "http://static.rhap.com/img/170x170/5/7/6/3/3963675_170x170.jpg"
    })

    image.width.should == 170
    image.height.should == 170
    image.url.should == "http://static.rhap.com/img/170x170/5/7/6/3/3963675_170x170.jpg"
  end
end

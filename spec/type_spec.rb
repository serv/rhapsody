require 'spec_helper'

describe Rhapsody::Type, '#initialize' do
  it "returns an Type object" do
    type = Rhapsody::Type.new({})
    type.class.name.should == "Rhapsody::Type"
  end

  it "responds to all the type attributes" do
    type = Rhapsody::Type.new({})
    type_attributes = [:id, :name]

    type_attributes.each do |attribute|
      type.respond_to?(attribute).should == true
    end
  end

  it "can initialize values for attributes of type" do
    type = Rhapsody::Type.new({
      :id => 0,
      :name => "Main Releases"
    })

    type.id.should == 0
    type.name.should == "Main Releases"
  end
end
require "spec_helper"
require "support/model"

describe Vidibus::Uuid::Mongoid do
  before(:each) do
    @model = Model.new
  end
  
  it "should add an uuid field to model" do
    @model.should respond_to(:uuid)
  end
  
  it "should generate a valid UUID before creation" do
    @model.save
    @model.uuid.length.should eql(32)
  end
  
  it "should keep the UUID persistent" do
    @model.save
    uuid = @model.uuid
    @model.update
    @model.uuid.should eql(uuid)
  end
end

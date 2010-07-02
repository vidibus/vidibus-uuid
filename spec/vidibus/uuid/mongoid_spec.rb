require "spec_helper"

describe "Vidibus::Uuid::Mongoid" do
  
  class Model
    include Mongoid::Document
    include Vidibus::Uuid::Mongoid
  end
  
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
    @model.save!
    @model.uuid.should eql(uuid)
  end
  
  it "should allow assignment of UUID" do
    uuid = Vidibus::Uuid.generate
    @model.uuid = uuid
    @model.save
    @model.uuid.should eql(uuid)
  end
  
  it "should allow changes to UUID" do
    uuid = Vidibus::Uuid.generate
    @model.save
    @model.update_attributes(:uuid => uuid)
    @model.uuid.should eql(uuid)
  end
  
  it "should verify presence of UUID" do
    @model.save
    @model.update_attributes(:uuid => nil)
    @model.errors[:uuid].length.should eql(1)
  end
  
  it "should verify uniqueness of UUID, at least in model" do
    @model.save
    another_model = Model.create(:uuid => @model.uuid)
    another_model.errors[:uuid].length.should eql(1)
  end
end

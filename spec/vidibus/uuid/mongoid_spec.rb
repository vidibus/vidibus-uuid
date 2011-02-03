require "spec_helper"

class Model
  include Mongoid::Document
  include Vidibus::Uuid::Mongoid
  embeds_many :children
end

class Child
  include Mongoid::Document
  include Vidibus::Uuid::Mongoid
  embedded_in :model, :inverse_of => :children
end

describe "Vidibus::Uuid::Mongoid" do
  let(:model) { Model.create }
  let(:new_model) { Model.new }
  let(:uuid) { Vidibus::Uuid.generate }

  it "should add an uuid field to model" do
    model.should respond_to(:uuid)
  end

  it "should generate a valid UUID before creation" do
    model.uuid.length.should eql(32)
  end

  it "should not generate a new UUID if a value has been set" do
    new_model.uuid = "test"
    new_model.save
    new_model.uuid.should eql("test")
  end

  it "should keep the UUID persistent" do
    uuid = model.uuid
    model.save!
    model.uuid.should eql(uuid)
  end

  it "should allow assignment of UUID" do
    new_model.uuid = uuid
    new_model.save
    new_model.uuid.should eql(uuid)
  end

  it "should allow changes to UUID" do
    model.update_attributes(:uuid => uuid)
    model.uuid.should eql(uuid)
  end

  it "should verify format of UUID" do
    model.update_attributes(:uuid => "as")
    model.errors[:uuid].length.should eql(1)
  end

  it "should verify uniqueness of UUID in class" do
    another_model = Model.create(:uuid => model.uuid)
    another_model.errors[:uuid].should have(1).error
  end

  it "should verify uniqueness of UUID in embedded documents" do
    first_child = model.children.create!
    second_child = model.children.create!
    second_child.update_attributes(:uuid => first_child.uuid)
    second_child.errors[:uuid].should have(1).error
    model.reload
    model.children[0].uuid.should_not eql(model.children[1].uuid)
  end

  describe "#to_param" do
    it "should be available" do
      model.should respond_to(:to_param)
    end

    it "should return the UUID" do
      model.to_param.should eql(model.uuid)
    end

    it "should return the new UUID if it has been changed" do
      new_uuid = "64d3a190d945012d4b2158b035f038ab"
      model.uuid = new_uuid
      model.to_param.should eql(new_uuid)
    end

    it "should return the original UUID if the new one is invalid" do
      old_uuid = model.uuid
      model.uuid = "invalid"
      model.to_param.should eql(old_uuid)
    end

    it "should return an invalid UUID, if it has not been set before" do
      new_uuid = "64d3a190d945012d4b2158b035f038ab"
      model.uuid = new_uuid
      model.to_param.should eql(new_uuid)
    end

    it "should return the old UUID if the new one is invalid, even though it has been reset before" do
      old_uuid = model.uuid
      model.uuid = nil
      model.uuid = "invalid"
      model.to_param.should eql(old_uuid)
    end
  end
end

require "spec_helper"

class ModelWithValidations
  include ActiveModel::Validations
  attr_accessor :required_uuid, :optional_uuid
  validates :required_uuid, :uuid => true
  validates :optional_uuid, :uuid => {:allow_blank => true}
end

describe Vidibus::Uuid::Validator do
  let(:model) {ModelWithValidations.new}

  it "should be available as uuid validator for attribute required_uuid" do
    ModelWithValidations.validators_on(:required_uuid).first.should be_a_kind_of(Vidibus::Uuid::Validator::UuidValidator)
  end

  it "should be available as uuid validator for attribute optional_uuid" do
    ModelWithValidations.validators_on(:optional_uuid).first.should be_a_kind_of(Vidibus::Uuid::Validator::UuidValidator)
  end

  it "should validate valid UUIDs" do
    model.required_uuid = "ddeb4500668e012d47bb58b035f038ab"
    model.should be_valid
  end

  it "should add an error for invalid UUIDs" do
    model.required_uuid = "ddeb4500668e0"
    model.should be_invalid
    model.errors[:required_uuid].should have(1).error
    model.errors[:required_uuid].first.should eql("is not a valid UUID")
  end

  it "should add an error on required_uuid, if empty" do
    model.required_uuid = ''
    model.should be_invalid
    model.errors[:required_uuid].should have(1).error
  end

  it "should allow emtpy optional_uuid" do
    model.required_uuid = "ddeb4500668e012d47bb58b035f038ab"
    model.optional_uuid = ""
    model.should be_valid
  end
end

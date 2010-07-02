require "spec_helper"

describe "Vidibus::ValidateUuid::UuidValidator" do
  
  class ModelWithValidations
    include ActiveModel::Validations
    attr_accessor :required_uuid, :optional_uuid
    validates :required_uuid, :uuid => true
    validates :optional_uuid, :uuid => { :allow_blank => true }
  end
  
  before(:each) do
    @model_with_validations = ModelWithValidations.new
  end
  
  it "should be available as uuid validator for attribute required_uuid" do
      ModelWithValidations.validators_on(:required_uuid).first.should be_a_kind_of(Vidibus::ValidateUuid::UuidValidator)
    end
    
    it "should be available as uuid validator for attribute optional_uuid" do
      ModelWithValidations.validators_on(:optional_uuid).first.should be_a_kind_of(Vidibus::ValidateUuid::UuidValidator)
    end
    
    it "should validate ddeb4500668e012d47bb58b035f038ab" do
      @model_with_validations.required_uuid = "ddeb4500668e012d47bb58b035f038ab"
      @model_with_validations.valid?.should be_true
    end
    
    it "should add an error on required_uuid, if empty" do
      @model_with_validations.required_uuid = ''
      @model_with_validations.valid?.should be_false
      @model_with_validations.errors[:required_uuid].should_not be_blank
    end
    
    it "should allow emtpy optional_uuid" do
      @model_with_validations.required_uuid = "ddeb4500668e012d47bb58b035f038ab"
      @model_with_validations.optional_uuid = ''
      @model_with_validations.valid?.should be_true
    end
end

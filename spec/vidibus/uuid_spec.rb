require "spec_helper"

describe "Vidibus::Uuid" do
  describe ".generate" do

  end
  it "should return a compact UUID" do
    uuid = Vidibus::Uuid.generate
    uuid.length.should eql(32)
  end

  describe ".validate" do
    it "should validate a valid compact UUID" do
      Vidibus::Uuid.validate("ddeb4500668e012d47bb58b035f038ab").should be_true
    end

    it "should validate a valid compact UUID that is given as symbol" do
      Vidibus::Uuid.validate(:ddeb4500668e012d47bb58b035f038ab).should be_true
    end

    it "should not validate an UUID that is not compact" do
      Vidibus::Uuid.validate("87a96db0-9a91-012d-59e4-58b035f038ab").should be_false
    end

    it "should not validate a string that looks like an UUID, but is too short" do
      Vidibus::Uuid.validate("dbeb4500668e0f839aefg928930efcca").should be_false
    end

    it "should not validate a random symbol" do
      Vidibus::Uuid.validate(:something).should be_false
    end

    it "should not validate a random string with 32 characters" do
      Vidibus::Uuid.validate("somerandomstringwith32characters").should be_false
    end

    it "should not validate a string containing non-hex characters" do
      Vidibus::Uuid.validate("xdeb4500668e012d47bb58b035f038ab").should be_false
    end

    it "should not validate nil" do
      Vidibus::Uuid.validate(nil).should be_false
    end

    it "should not validate an empty string" do
      Vidibus::Uuid.validate("").should be_false
    end
  end
end

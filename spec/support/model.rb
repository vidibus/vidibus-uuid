require "rubygems"
require "mongoid"

class Model
  include Mongoid::Document
  include Vidibus::Uuid::Mongoid
end
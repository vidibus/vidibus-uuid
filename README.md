# Vidibus::Uuid [![](http://travis-ci.org/vidibus/vidibus-uuid.png)](http://travis-ci.org/vidibus/vidibus-uuid) [![](http://stillmaintained.com/vidibus/vidibus-uuid.png)](http://stillmaintained.com/vidibus/vidibus-uuid)

Generates and validates compact UUIDs. Basically, this is an abstraction of http://github.com/assaf/uuid

This gem is part of [Vidibus](http://vidibus.org), an open source toolset for building distributed (video) applications.


## Installation

Add `gem "vidibus-uuid"` to your Gemfile. Then call `bundle install` on your console.


## Usage

```ruby
Vidibus::Uuid.generate
# => "b063263064e0012d47b658b035f038ab"

Vidibus::Uuid.validate("b063263064e0012d47b658b035f038ab")
# => true
```

### Usage in Mongoid model

Include the Vidibus::Uuid::Mongoid module in your Mongoid model:

```ruby
class MyModel
  include Mongoid::Document
  include Vidibus::Uuid::Mongoid
end
```


### Validation of custom attributes

To verfify that custom attributes are formatted as UUID, add the uuid validator to your model:

```ruby
class MyModel
  include Mongoid::Document
  field :product_uuid
  validates :product_uuid, :uuid => {:allow_blank => true}
end
```


## Copyright

&copy; 2010-2011 Andre Pankratz. See LICENSE for details.

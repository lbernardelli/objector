# Objector

**Objector** is a ruby library to facilitate objects instantiation from hash, including all tree.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'objector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install objector

## Usage

Just includes objector to your object like:

```ruby
class SomeClass
  include Objector
  
  attr_reader :attr_1, :attr_2
end
```
and it's done! 

You can build your object simple passing a hash to it' constructor.

```ruby
obj = SomeClass.new({attr_1: 'value 1', attr_2: 'value 2'})
 
obj.attr_1
=> 'value 1'
 
obj.attr_2
=> 'value 2'
```

You can setup a hierarchical tree of objects like:

```ruby
class SomeClass
  include Objector
  
  attr_reader :attr_1, :other_class
end
 
class OtherClass
  include Objector

  attr_reader :name
end
 
obj = SomeClass.new({attr_1: 'value 1', other_class: {attr: 'other class attribute'}})
 
obj.attr_1
=> 'value 1'
 
obj.other_class.attr
=> 'other class attribute'
 
obj.other_class.class
=> OtherClass

```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lbernardelli/objector. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


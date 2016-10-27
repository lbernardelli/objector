require 'objector/version'

module Objector
  def initialize(args = {})
      args.each do |k, v|
        if has_attribute?(k)
          result = v.instance_of?(Array) ? build_all_from_array(k, v) : instantiate_object(v, k)
          add(k, result)
        end
      end
  end

  private

  def build_all_from_array(k, v)
    v.inject([]) { |arr, v1| arr << instantiate_object(v1, k) }
  end

  def add(attribute, result)
    instance_variable_set("@#{attribute}", result)
  end

  def has_attribute?(k)
    !defined?(k).nil?
  end

  def instantiate_object(value, klass)
    value.instance_of?(Hash) ? Object.const_get(class_name(klass)).new(value) : value
  end

  def class_name(klass)
    klass.to_s.split('_').map { |v| v.capitalize }.join
  end

  def get_module_name
    (self.class.name =~ /^(.+::).+$/) ? $1 : ''
  end
end

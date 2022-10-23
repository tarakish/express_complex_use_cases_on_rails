class Person
  include ActiveModel::Serialization

  attr_reader:name, :age

  def attributes
    { "name" => name, "age" => age }
  end
end
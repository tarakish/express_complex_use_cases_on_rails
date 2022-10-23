class Person
  include ActiveModel::Serialization

  attr_reader:name, :age

  def attributes
    { "name" => name, "age" => age }
  end

  def to_xml(option = nil)
    serializable_hash(option).to_xml(camelize: :lower, root: self.class.name)
  end
end
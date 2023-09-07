require_relative 'person'
require 'json'

class Teacher < Person
  def initialize(age, specialization, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(option = {})
    {
      id: @id,
      age: @age,
      specialization: @specialization,
      name: @name
    }.to_json(option)
  end
end

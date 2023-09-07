require_relative 'person'
require 'json'

class Student < Person
  attr_accessor :name
  attr_reader :classroom

  def initialize(age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(option = {})
    {
      id: @id,
      age: @age,
      parent_permission: @parent_permission,
      name: @name
    }.to_json(option)
  end
end

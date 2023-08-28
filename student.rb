require_relative 'person_spec'

class Student < Person
  def initialize(age, parent_permission: true, name: 'Unknown', classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

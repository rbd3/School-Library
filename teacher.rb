require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, parent_permission: true, name: 'Unknown')
    super(parent_permission: parent_permission, name: name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

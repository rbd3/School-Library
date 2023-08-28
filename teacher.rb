require_relative 'person_spec'

class Teacher < Person
  def initialize(age, parent_permission: true, name: 'Unknown', specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

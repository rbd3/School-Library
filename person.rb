class Person
  def initialize(age, parent_permission: true, name = 'Unknown')
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    @age >= 18 || @parent_permission == true
  end
end

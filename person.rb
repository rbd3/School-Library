class Person
  def initialize(age, parent_permission: true, name: 'Unknown')
    @name = name
    @age = age
    @parent_permission = parent_permission
   end
   
   def id()
    @id
   end

   def name()
    @name    
    end

    def age()
     @age
    end

    def id=(id)
      @id = id
    end

    def name=(name)
      @name = name
    end

    def age=(age)
      @age = age
    end
    
    private
    def of_age?
      @age >= 18
    end

    public
    def can_use_services?
      @age >= 18 || @parent_permission == true
    end
end

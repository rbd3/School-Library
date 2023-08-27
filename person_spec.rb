class Person
    def initialize(name = "Unknown", age, parent_permission = true)
        @name = name
        @age = age
        @parent_permission = parent_permission
   end
   
   def get_id()
    @id
   end

   def get_name()
    @name    
    end

    def get_age()
     @age
    end

    def set_id(id)
        @id = id
    end

    def set_name(name)
        @name = name
    end

    def set_age(age)
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
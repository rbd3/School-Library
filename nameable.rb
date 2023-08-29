class Nameable
  def initialize(name)
    @name = name
  end

  def correct_name(name)
    return if name == '' 
    raise NotImplementedError, 'Subclasses must implement this method'
    end
  end
end

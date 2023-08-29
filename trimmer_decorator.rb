require_relative 'base_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name.length > 10
      @nameable.correct_name[0...10].strip
    else
      @nameable.correct_name.strip
    end
  end
end

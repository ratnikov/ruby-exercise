class Person
  attr_accessor :last, :first, :middle, :gender, :color, :date_of_birth

  def initialize options = nil
    if options
      self.gender = parse_gender options[:gender] if options.has_key?(:gender)
    end
  end

  def male?
    self.gender == :male
  end


  private

  def parse_gender gender
    case gender
    when 'Male', 'M' then :male
    when 'Female', 'F' then :female
    else
      raise ArgumentError, "What gender is this: #{gender.inspect}?"
    end
  end
end

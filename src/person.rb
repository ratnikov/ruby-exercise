require 'date'

class Person
  attr_accessor :last, :first, :middle, :gender, :color
  attr_reader :date_of_birth

  def initialize options = nil
    if options
      self.gender = parse_gender options[:gender] if options.has_key?(:gender)
      self.date_of_birth = options[:birth] if options.has_key?(:birth)
    end
  end

  def male?
    self.gender == :male
  end

  def date_of_birth= date
    # replace the - with / so that usual date parser can understand it
    @date_of_birth = Date.parse date.gsub(/-/, '/')
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

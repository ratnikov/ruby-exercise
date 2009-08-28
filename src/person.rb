require 'date'

class Person
  attr_accessor :last, :first, :middle, :color
  attr_reader :date_of_birth

  def initialize options = nil
    if options
      options.each do |(key, value)|
	self.send "#{key}=", value
      end
    end
  end

  def gender= gender
    @gender = 
      case gender
      when 'Male', 'M' then :male
      when 'Female', 'F' then :female
      else
	raise ArgumentError, "What gender is this: #{gender.inspect}?"
      end
    # @gender =
  end

  def gender
    male? ? 'Male' : 'Female'
  end

  def male?
    @gender == :male
  end

  def date_of_birth= date
    # replace the - with / so that usual date parser can understand it
    @date_of_birth = date.gsub(/-/, '/')
  end

  def to_s
    [ last, first, gender, date_of_birth, color ].join ' '
  end
end

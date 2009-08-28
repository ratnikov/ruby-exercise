require 'csv'

module Parser
  extend self

  def parse_pipe stream
    CSV.parse(stream, ' | ', "\n").map do |person_attributes|
      last, first, middle, gender, color, dob = *person_attributes.map(&:strip)
      Person.new :first => first, :last => last, :gender => gender, :color => color, :date_of_birth => dob
    end
  end

  def parse_comma stream
    CSV.parse(stream, ', ').map do |person_attributes|
      last, first, gender, color, dob = *person_attributes.map(&:strip)
      Person.new :first => first, :last => last, :gender => gender, :color => color, :date_of_birth => dob
    end
  end

  def parse_space stream
    CSV.parse(stream, ' ').map do |person_attributes|
      # gotta compact since there may be some leading spaces
      last, first, middle, gender, dob, color = *person_attributes.compact.map(&:strip)
      Person.new :first => first, :last => last, :gender => gender, :color => color, :date_of_birth => dob
    end
  end
end

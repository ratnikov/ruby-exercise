require 'test_helper'

class ParserTest < Test::Unit::TestCase
  def test_truth
    assert true 
  end

  def test_parse_pipe
    parsed_people = Parser.parse_pipe <<-SAMPLE
    Jack | Johnson | J | M | Red | 3-3-1985
    Brenda | Brian | B | F | Blue | 6-3-1975
    SAMPLE

    assert_equal [ 'Johnson Jack Male 3/3/1985 Red', 'Brian Brenda Female 6/3/1975 Blue' ], parsed_people.map(&:to_s)
  end
end

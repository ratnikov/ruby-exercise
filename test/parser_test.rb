require 'test_helper'

class ParserTest < Test::Unit::TestCase
  def test_truth
    assert true 
  end

  def setup
    @expected_output = [ 'Johnson Jack Male 3/3/1985 Red', 'Brian Brenda Female 6/3/1975 Blue' ]
  end

  def test_parse_pipe
    parsed_people = Parser.parse_pipe <<-SAMPLE
    Johnson | Jack | J | M | Red | 3-3-1985
    Brian | Brenda | B | F | Blue | 6-3-1975
    SAMPLE

    assert_equal @expected_output, parsed_people.map(&:to_s)
  end

  def test_parse_comma
    parsed_people = Parser.parse_comma <<-SAMPLE
    Johnson, Jack, Male, Red, 3/3/1985
    Brian, Brenda, Female, Blue, 6/3/1975
    SAMPLE

    assert_equal @expected_output, parsed_people.map(&:to_s) 
  end

  def test_parse_space
    parsed_people = Parser.parse_space <<-SAMPLE
    Johnson Jack J M 3-3-1985 Red
    Brian Brenda B F 6-3-1975 Blue
    SAMPLE

    assert_equal @expected_output, parsed_people.map(&:to_s)
  end
end

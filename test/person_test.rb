require 'test_helper'

class PersonTest < Test::Unit::TestCase
  def test_truth; assert true end

  def test_gender
    assert_equal true, Person.new(:gender => 'M').male?, "Should be male if gender is 'M'"
    assert_equal false, Person.new(:gender => 'F').male?, "Should be female if gender is 'F'"

    assert_equal true, Person.new(:gender => 'Male').male?, "Should be male if gender is 'Male'"
    assert_equal false, Person.new(:gender => 'Female').male?, "Should be female if gender is 'Female'"
  end

  def test_date_of_birth
    assert_equal Date.parse("August 13, 1975"), Person.new(:birth => '8-13-1975').date_of_birth, "Should regognize the dashed format"
    assert_equal Date.parse("August 13, 1975"), Person.new(:birth => '8/13/1975').date_of_birth, "Should recognize the slash format"
  end
end

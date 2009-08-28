require 'test_helper'

class PersonTest < Test::Unit::TestCase
  def test_truth; assert true end

  def test_gender_assignment
    assert_equal true, Person.new(:gender => 'M').male?, "Should be male if gender is 'M'"
    assert_equal false, Person.new(:gender => 'F').male?, "Should be female if gender is 'F'"

    assert_equal true, Person.new(:gender => 'Male').male?, "Should be male if gender is 'Male'"
    assert_equal false, Person.new(:gender => 'Female').male?, "Should be female if gender is 'Female'"
  end

  def test_gender_accessor
    assert_equal 'Male', Person.new(:gender => 'M').gender
    assert_equal 'Female', Person.new(:gender => 'F').gender
  end

  def test_date_of_birth_assignment
    assert_equal '8/13/1975', Person.new(:date_of_birth => '8-13-1975').date_of_birth, "Should regognize the dashed format"
    assert_equal '8/13/1975', Person.new(:date_of_birth => '8/13/1975').date_of_birth, "Should recognize the slash format"
  end

  def test_usual_attributes
    assert_equal 'Johnson', Person.new(:last => 'Johnson').last, "Should return last name correctly"
    assert_equal 'Jack', Person.new(:first => 'Jack').first, "Should return first name correctly"
    assert_equal 'Red', Person.new(:color => 'Red').color, 'Should return the color correctly'
  end

  def test_to_s
    assert_equal 'Johnson Jack Male 6/3/1985 Red', Person.new(:first => 'Jack', :last => 'Johnson', :gender => 'M', :date_of_birth => '6-3-1985', :color => 'Red').to_s
  end
end

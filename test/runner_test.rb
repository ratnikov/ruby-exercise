require 'test_helper'

class RunnerTest < Test::Unit::TestCase
  def test_truth; assert true end

  def test_running
    file_prep = proc { |file| File.join File.dirname(__FILE__), '..', file }
    output = Runner.run :pipe => handle_file('data/pipe.txt'), :comma => handle_file('data/comma.txt'), :space => handle_file('data/space.txt')

    assert_equal File.open(handle_file('data/output.txt')).read.strip, output.strip
  end

  private

  def handle_file file
    File.join File.dirname(__FILE__), '..', file
  end
end

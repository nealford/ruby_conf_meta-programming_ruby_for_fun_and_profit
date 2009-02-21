require "test/unit"

require "grades"


class TestGrades < Test::Unit::TestCase

  TestGrades.class_eval do
    grade_range = {
      'A' => 90..100, 
      'B' => 80...90,
      'C' => 70...80,
      'D' => 60...70,
      'F' => 0...60}

    grade_range.each do |k, v|
      method_name = ("test_" + k + "_letter_grade").to_sym 
      define_method method_name do
        for g in v
          assert_equal k, Grade.for_score_of(g)
        end
      end
    end
  end
  
  def test_not_an_integer
    assert_raise(RuntimeError) { Grade.for_score_of 12.3 }
  end
    

  def test_letters
    for g in 'A'..'D'
      assert_equal g, Grade.for_score_of(g)
    end
    assert_equal 'F', Grade.for_score_of('F')    
  end
  
  def test_numerical_grades
    for g in 90..100
      assert_equal "A", Grade.for_score_of(g)
    end
    for g in 80...90
      assert_equal "B", Grade.for_score_of(g)
    end
  end
end

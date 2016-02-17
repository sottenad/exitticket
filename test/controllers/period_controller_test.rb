require 'test_helper'

class PeriodControllerTest < ActionController::TestCase
  test "should not save period without number" do
      period = Period.new
      assert_not period.save, 'Saved without period number'
  end
    
  test "should create period" do
      period = Period.new
      period.teacher = teachers(:teacher1)
      period.title = 'Math 2'
      period.number = 2
      assert period.save, 'Period did not create'
  end
    
end

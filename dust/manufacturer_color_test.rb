require File.dirname(__FILE__) + '/../unit_test_helper'

unit_tests do
  
  test "reference color description" do
    color = ManufacturerColor.new
    color.stubs(:reference_color).returns(stub(:description => :the_description))
    assert_equal :the_description, color.reference_color_description
  end
  
  test "reference color description when empty" do
    color = ManufacturerColor.new
    color.stubs(:reference_color).returns(nil)
    assert_equal nil, color.reference_color_description
  end
  
end
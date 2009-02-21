functional_tests do
  test "given no name, when validated, then error is in the objects error collection" do
    instance = Klass.new
    instance.valid?
    assert_equal "can't be empty", instance.errors.on(:name)
  end
end
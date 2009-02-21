require "test/unit"
require "door"

class DoorTest < Test::Unit::TestCase
  def test_an_open_door_is_opened_and_not_closed
    door = Door.new :open
    assert door.opened?
    assert !door.closed?
  end

  def test_a_closed_door_is_closed_and_not_opened
    door = Door.new
    assert door.closed?
    assert !door.opened?
  end

  def test_closing_an_open_door_makes_the_door_closed_but_not_opened
    door = Door.new :open
    door.close
    assert door.closed?
    assert !door.opened?
  end

  def test_opening_a_closed_door_makes_the_door_opened_but_not_closed
    door = Door.new
    door.open
    assert door.opened?
    assert !door.closed?
  end
end
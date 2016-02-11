require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require_relative '../lib/junglebeat'

class JungleBeat_Test < Minitest::Test

  # initialize
  def test_it_can_initialize_list_with_single_value
    jb = JungleBeat.new("first")
    assert_equal "first", jb.head.value
  end

  def test_it_can_initialize_list_with_multiple_values
    jb = JungleBeat.new("first second")
    assert_equal "first", jb.head.value
    assert_equal "second", jb.head.next_node.value
  end

  # append
  def test_it_can_append_exisiting_list
    jb = JungleBeat.new("first")
    jb.append("second")
    assert_equal "second", jb.head.next_node.value
  end

  def test_it_can_append_multiples
    jb = JungleBeat.new("first second")
    jb.append("third")
    jb.step_through
    assert_equal "third", jb.head.next_node.next_node.value
  end

  # prepend
  def test_it_can_prepend_singles
    jb = JungleBeat.new("second")
    jb.prepend("first")
    assert_equal "first", jb.head.value
  end

  def test_it_can_prepend_multiples
    jb = JungleBeat.new("third")
    jb.prepend("first second")
    assert_equal "first", jb.head.value
    assert_equal "second", jb.head.next_node.value
  end

  #all
  def test_all
    jb = JungleBeat.new("first second third")
    assert_equal "first second third", jb.all
  end

  #play
  def test_play
    jb = JungleBeat.new("first second third")
    # assert_equal `say -r 500 -v Boing "first second third"`, jb.play
  end

  #count
  def test_count
    jb = JungleBeat.new("first second third")
    assert_equal 3, jb.count
  end

  #include?
  def test_include?
    jb = JungleBeat.new("first second third")
    assert jb.include?("first")
    refute jb.include?("fourth")
  end

  #pop
  def test_pop
    jb = JungleBeat.new("first second third")
    assert_equal "second third", jb.pop(2)
    assert_equal 1, jb.count
  end

  def test_it_wont_pop_more_items_than_on_list
    jb = JungleBeat.new("first second third")
    assert_equal "I can't pop that many things", jb.pop(4)
  end

  #insert
  def test_insert_singles
    jb = JungleBeat.new("first second fourth")
    jb.insert(2, "third")
    assert_equal 4, jb.count
    assert_equal "first second third fourth", jb.all
  end

  def test_insert_multiples
    jb = JungleBeat.new("first fourth")
    jb.insert(1, "second third")
    assert_equal 4, jb.count
    assert_equal "first second third fourth", jb.all
  end

  def test_insert_at_zero
    jb = JungleBeat.new("second third fourth")
    jb.insert(0, "first")
    assert_equal 4, jb.count
    assert_equal "first second third fourth", jb.all
  end

  def test_insert_position_equals_list_count
    jb = JungleBeat.new("first second third")
    jb.insert(3, "fourth")
    assert_equal 4, jb.count
    assert_equal "first second third fourth", jb.all
  end

  def test_insert_positiong_greater_than_list_count
    jb = JungleBeat.new("first second third")
    assert_equal "CANNOT COMPUTE", jb.insert(4, "fifth")
  end

  #find
  def test_find
    jb = JungleBeat.new("first second third fourth")
    assert_equal "third fourth", jb.find(2, 2)
  end

  def test_find_again
    jb = JungleBeat.new("first second third fourth fifth sixth")
    assert_equal "second third fourth", jb.find(1,3)
  end

  def test_find_position_greater_than_list_count
    jb = JungleBeat.new("first second third fourth fifth sixth")
    assert_equal "CANNOT COMPUTE", jb.find(3, 4)
  end

  def test_find_position_greater_than_list_count
    jb = JungleBeat.new("first second third fourth fifth sixth")
    assert_equal "fourth fifth sixth", jb.find(3, 3)
  end

end

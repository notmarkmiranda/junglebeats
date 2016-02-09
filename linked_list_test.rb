require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'
require 'pry'

class LinkedListTest < Minitest::Test

  def test_empty_head_node_is_created_with_a_new_list
    list = LinkedList.new
    assert_equal nil, @head
    assert_equal nil, @tail
  end

  def test_append_an_element_to_the_empty_head_of_the_list
    list = LinkedList.new
    list.append("First Value")
    assert_equal "First Value", list.head.data
    assert_equal nil, list.head.next
  end
  def test_append_second_item_to_list
    list = LinkedList.new
    list.append("First")
    list.append("Second")
    assert_equal "First", list.head.data
    assert_equal "Second", list.tail.data
    assert_equal nil, list.tail.next
  end

  def test_prepend_an_element_to_the_beginning_of_the_list
    list = LinkedList.new
    list.append("First")
    list.prepend("Zeroth")
    assert_equal "Zeroth", list.head.data
  end

  def test_prepend_empty_list
    list = LinkedList.new
    list.prepend("Zeroth")
    assert_equal "Zeroth", list.head.data
  end

  def test_prepend_twice
    list = LinkedList.new
    list.append("Second")
    list.prepend("First")
    list.prepend("Zeroth")
    assert_equal "Zeroth", list.head.data
    assert_equal "Second", list.tail.data
    assert_equal nil, list.tail.next
  end

  def test_insert_one_or_more_elements_at_an_arbitrary_position_in_the_list
    list = LinkedList.new
    list.append("First")
    list.append("Second")
    list.append("Fourth")
    list.insert(3, "Third")
    assert_equal "Third", list.head.next.next.data
  end
  #includes? gives back true or false whether the supplied value is in the list
  #pop one or more elements in the list
  #count the number of elements in the list
  #find one or more elements based on arbitrary positions in the list. the first paramenter indicates the first position to return and the second parameter specifies how many elements to return
  #all return all elements in the linked list in orderw

end

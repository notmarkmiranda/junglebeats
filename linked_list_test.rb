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

  def test_append_an_element_to_the_head_of_the_list
    list = LinkedList.new
    list.append("First Value")
    binding.pry
    assert_equal "First Value", list.head.data
  end
  #prepend an element to the beginning of the list
  #insert one or more elements at an arbitrary position in the list
  #includes? gives back true or false whether the supplied value is in the list
  #pop one or more elements in the list
  #count the number of elements in the list
  #find one or more elements based on arbitrary positions in the list. the first paramenter indicates the first position to return and the second parameter specifies how many elements to return
  #all return all elements in the linked list in orderw

end

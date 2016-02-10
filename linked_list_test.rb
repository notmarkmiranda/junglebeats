require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'
require 'pry'

class LinkedListTest < Minitest::Test
  def test_separate_creates_array_of_separated_strings
    list = LinkedList.new("first second")
    
  end
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/node'

class NodeTest < Minitest::Test

  def test_it_can_create_a_node
    node = Node.new("value")
    assert_equal "value", node.value
  end

  def test_next_is_nil
    node = Node.new("value")
    assert_equal nil, node.next_node
  end
end

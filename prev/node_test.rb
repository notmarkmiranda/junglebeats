require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'node'
require 'pry'

class NodeTest < Minitest::Test

  def test_can_create_a_node
    node = Node.new("data")
    assert_equal "data", node.data
  end

  def test_link_is_nil
    node = Node.new("data")
    assert_equal nil, node.link
  end

end

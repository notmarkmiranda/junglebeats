require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'node'
require 'pry'

class NodeTest < Minitest::Test

  def test_it_can_create_an_empty_node
    node = Node.new
    assert_equal nil, node.data
    assert_equal nil, node.link
  end

  def test_it_can_create_a_node_with_just_data_and_a_nil_link
    node = Node.new("data")
    assert_equal "data", node.data
    assert_equal nil, node.link
  end

  def test_it_can_change_link_of_nil_links
    node = Node.new("data")
    assert_equal nil, node.link
    node.link = "new link"
    assert_equal "new link", node.link
  end

end

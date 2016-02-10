require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'junglebeat'
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_it_can_initialize_with_head_data
    list = JungleBeat.new("deep")
    assert_equal "deep", list.head.data
  end

  def test_it_can_take_multiple_words
    list = JungleBeat.new("deep bop bop deep")
    assert_equal "deep", list.head.data
    assert_equal "bop", list.head.next.data
    assert_equal "bop", list.head.next.next.data
    assert_equal "deep", list.head.next.next.next.data
  end

end

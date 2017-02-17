require_relative '../../app/models/tile_rack'
require 'minitest/autorun'

# Test suite for the TileRack#remove_word method
class TestRemoveWord < MiniTest::Test

  # Called before each test
  def setup
    @rack = TileRack.new
  end

  # Test that we can remove a word when the letters are in the proper order on the rack
  def test_can_remove_a_word_whose_letters_are_in_order_on_the_rack
    "ALEWBIS".each_char { |x| @rack.append x.to_sym }
    word = @rack.remove_word("LEWIS")
    assert_equal "AB", @rack.hand
    assert_equal "LEWIS", word.hand
  end

  # Test that we can remove a word when the letters are not in the proper order on the rack
  def test_can_remove_a_word_whose_letters_are_not_in_order_on_the_rack
    "ILAWEBS".each_char { |x| @rack.append x.to_sym }
    word = @rack.remove_word("LEWIS")
    assert_equal "AB", @rack.hand
    assert_equal "LEWIS", word.hand
  end

  # Test that we can remove all tiles of a word from the rack, when that word has duplicate letters
  def test_can_remove_word_with_duplicate_letters
    "FUBXFYZ".each_char { |x| @rack.append x.to_sym }
    word = @rack.remove_word("BUFF")
    assert_equal "XYZ", @rack.hand
    assert_equal "BUFF", word.hand
  end

  # Test that non-needed duplicate letters are not removed from the rack
  def test_can_remove_word_without_removing_unneeded_duplicate_letters
    "ZJAZZYA".each_char { |x| @rack.append x.to_sym }
    word = @rack.remove_word("JAZZ")
    assert_equal "ZYA", @rack.hand
    assert_equal "JAZZ", word.hand
  end
end

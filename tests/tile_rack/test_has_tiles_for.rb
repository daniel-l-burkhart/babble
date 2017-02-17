require_relative '../../app/models/tile_rack'
require 'minitest/autorun'

# Test suite for the TileRack#has_tiles_for? method
class TestHasTilesFor < MiniTest::Test
	
	# Called before each test
	def setup
		@rack = TileRack.new
	end
	
	# Test to see if a word with no duplicate letters can be found in the rack...when those
	# letters are in the proper order in the rack
	def test_rack_has_needed_letters_when_letters_are_in_order_no_duplicates
		"ALEWBIS".each_char { |x| @rack.append x.to_sym }
		assert @rack.has_tiles_for? "LEWIS"
	end
	
	# Test to see if a word with no duplicate letters can be found in the rack...when
	# those letters are not in the proper order in the rack
	def test_rack_has_needed_letters_when_letters_are_not_in_order_no_duplicates
		"ILAWEBS".each_char { |x| @rack.append x.to_sym }
		assert @rack.has_tiles_for? "LEWIS"
	end
	
	# Test to see if a word is not in the rack when no letters of the word are in the rack
	def test_rack_doesnt_contain_any_needed_letters
		"BUGABOO".each_char { |x| @rack.append x.to_sym }
		assert !(@rack.has_tiles_for? "LEWIS")
	end
	
	# Test to see if a word is not in the rack when some of the word's letters are in the rack
	def test_rack_contains_some_but_not_all_needed_letters
		"BUEABLO".each_char { |x| @rack.append x.to_sym }
		assert !(@rack.has_tiles_for? "LEWIS")
	end
	
	# Tests that a word with duplicate letters can be made from the tiles in the rack
	def test_rack_contains_a_word_with_duplicate_letters
		"FUBXFXX".each_char { |x| @rack.append x.to_sym }
		assert @rack.has_tiles_for? "BUFF"
	end
	
	# Tests the situation where a rack has all the needed letters but not enough of each, i.e.,
	# where it has one, but not all, of the needed duplicate letters
	def test_rack_doesnt_contain_enough_duplicate_letters
		"QUBXFXX".each_char { |x| @rack.append x.to_sym }
		assert !(@rack.has_tiles_for? "BUFF")
	end
end

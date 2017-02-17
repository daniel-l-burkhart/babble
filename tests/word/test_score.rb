require_relative '../../app/models/word'
require 'minitest/autorun'

# Test suite for the Word#score method
class WhenScoringWords < MiniTest::Test
	
	def setup
		@word = Word.new
	end
	
	# Tests that an empty word has a zero score
	def test_empty_word_should_have_score_of_zero
		assert_equal 0, @word.score
	end
	
	# Tests the case of a word with a single tile
	def test_score_a_one_tile_word
		@word.append :X
		assert_equal 8, @word.score
	end
	
	# Tests the case of a word with multiple, but different, tiles
	def test_score_a_word_having_multiple_different_tiles
		"LEWIS".each_char { |x| @word.append x.to_sym }
		assert_equal 8, @word.score
	end
	
	# Tests the case of a word with multiple tiles, some the same
	def test_score_a_word_with_recurring_tiles
		"BOGO".each_char { |x| @word.append x.to_sym }
		assert_equal 7, @word.score
	end
end

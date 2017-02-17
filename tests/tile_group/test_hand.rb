require_relative '../../app/models/tile_group'
require 'minitest/autorun'

class TestHand < MiniTest::Test
		
	# Called before each test
	def setup
		@group = TileGroup.new
	end
	

	def test_convert_empty_group_to_string
		assert_equal "", @group.hand
	end
	

	def test_convert_single_tile_group_to_string
		@group.append :X
		assert_equal "X", @group.hand
	end
	

	def test_convert_multi_tile_group_to_string
		[:L, :E, :W, :I,  :S].each { |x| @group.append(x) }
		assert_equal "LEWIS", @group.hand
	end
	

	def test_convert_multi_tile_group_with_repeating_values_to_string
		[ :B, :A, :B, :A, :A, :X ].each { |x| @group.append(x) }
		assert_equal "BABAAX", @group.hand
	end
end

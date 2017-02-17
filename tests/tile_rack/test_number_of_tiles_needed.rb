require_relative '../../app/models/tile_rack'
require 'minitest/autorun'

# Test suite for the TileRack#number_of_tiles_needed method
class TestNumberOfTiles < MiniTest::Test

	# Called before each test method
	def setup
		@rack = TileRack.new
	end

	# Test the case where the TileRack is empty
	def test_empty_tile_rack_should_need_max_tiles
		assert_equal TileRack::MAX_TILES, @rack.number_of_tiles_needed
	end
	
	# Test the case where the TileRack has one tile
	def test_tile_rack_with_one_tile_should_need_max_minus_one_tiles
		@rack.append :X
		assert_equal TileRack::MAX_TILES - 1, @rack.number_of_tiles_needed
	end
	
	# Test the case where the TileRack has multiple tiles
	def test_tile_rack_with_several_tiles_should_need_some_tiles
		@rack.append :X
		@rack.append :Y
		@rack.append :Z
		
		assert_equal TileRack::MAX_TILES - 3, @rack.number_of_tiles_needed
	end
	
	# Test the case where the TileRack has MAX_SIZE tiles
	def test_that_full_tile_rack_doesnt_need_any_tiles
		TileRack::MAX_TILES.times { |x| @rack.append :X }
		assert_equal 0, @rack.number_of_tiles_needed
	end
end

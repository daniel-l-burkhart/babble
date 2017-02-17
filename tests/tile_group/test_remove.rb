require_relative '../../app/models/tile_group'
require 'minitest/autorun'

class TestRemove < Minitest::Test

	def setup
		@one_tile_group = TileGroup.new
		@one_tile_group.append :A
		
		@many_tiles_group = TileGroup.new
		@many_tiles_group.tiles = [:A, :B, :C]
		
		@group_with_duplicate_tiles = TileGroup.new
		@group_with_duplicate_tiles.tiles = [:A, :B, :A, :C]
	end
	
	def test_remove_only_tile
		@one_tile_group.remove :A
		assert_equal [], @one_tile_group.tiles
	end
	
	def test_remove_first_tile
		@many_tiles_group.remove :A
		assert_equal [:B, :C], @many_tiles_group.tiles
	end
	
	def test_remove_last_tile
		@many_tiles_group.remove :C
		assert_equal [:A, :B], @many_tiles_group.tiles
	end
	
	def test_remove_middle_tile
		@many_tiles_group.remove :B
		assert_equal [:A, :C], @many_tiles_group.tiles
	end
	
	def test_remove_multiple_tiles
		@many_tiles_group.remove :A
		@many_tiles_group.remove :B
		assert_equal [:C], @many_tiles_group.tiles
	end
	
	def test_make_sure_duplicates_are_not_removed
		@group_with_duplicate_tiles.remove :A
		assert_equal [:B, :A, :C], @group_with_duplicate_tiles.tiles
	end
	
end

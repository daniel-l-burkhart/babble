require_relative '../../app/models/tile_group'
require 'minitest/autorun'

class TestInitialize < Minitest::Test

	def test_create_empty_tile_group
		group = TileGroup.new
		assert 0, group.tiles.size
	end

end

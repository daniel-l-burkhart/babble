require_relative '../../app/models/tile_bag.rb'
require 'minitest/autorun'

# Unit test class for the TileBag#drawTile method
class TestDrawTile < MiniTest::Test


  # Tests that a new TileBag has a complete set (numerically) of tiles
  def test_has_proper_number_of_tiles
    bag = TileBag.new
    98.times {
      assert !bag.empty?
      bag.draw_tile
    }

    assert bag.empty?
  end

  # Tests that a new TileBag has the proper distribution of tiles
  def test_has_proper_tile_distribution
    dist = {:A => 0,
            :B => 0,
            :C => 0,
            :D => 0,
            :E => 0,
            :F => 0,
            :G => 0,
            :H => 0,
            :I => 0,
            :J => 0,
            :K => 0,
            :L => 0,
            :M => 0,
            :N => 0,
            :O => 0,
            :P => 0,
            :Q => 0,
            :R => 0,
            :S => 0,
            :T => 0,
            :U => 0,
            :V => 0,
            :W => 0,
            :X => 0,
            :Y => 0,
            :Z => 0}

    bag = TileBag.new
    98.times {
      tile = bag.draw_tile
      dist[tile] += 1
    }

    assert_equal 9, dist[:A]
    assert_equal 2, dist[:B]
    assert_equal 2, dist[:C]
    assert_equal 4, dist[:D]
    assert_equal 12, dist[:E]
    assert_equal 2, dist[:F]
    assert_equal 3, dist[:G]
    assert_equal 2, dist[:H]
    assert_equal 9, dist[:I]
    assert_equal 1, dist[:J]
    assert_equal 1, dist[:K]
    assert_equal 4, dist[:L]
    assert_equal 2, dist[:M]
    assert_equal 6, dist[:N]
    assert_equal 8, dist[:O]
    assert_equal 2, dist[:P]
    assert_equal 1, dist[:Q]
    assert_equal 6, dist[:R]
    assert_equal 4, dist[:S]
    assert_equal 6, dist[:T]
    assert_equal 4, dist[:U]
    assert_equal 2, dist[:V]
    assert_equal 2, dist[:W]
    assert_equal 1, dist[:X]
    assert_equal 2, dist[:Y]
    assert_equal 1, dist[:Z]

  end

end

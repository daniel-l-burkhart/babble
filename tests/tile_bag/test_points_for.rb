require_relative '../../app/models/tile_bag.rb'
require 'minitest/autorun'

# Test suite for the TileBag::points_for method
class TestPointsFor < MiniTest::Test

  # Tests that points_for returns the proper values for each tile
  def test_confirm_point_values
    [:E, :A, :I, :O, :N, :R, :T, :L, :S, :U].each { |x| assert_equal 1, TileBag.points_for(x) }
    [:D, :G].each { |x| assert_equal 2, TileBag.points_for(x) }
    [:B, :C, :M, :P].each { |x| assert_equal 3, TileBag.points_for(x) }
    [:F, :H, :V, :W, :Y].each { |x| assert_equal 4, TileBag.points_for(x) }
    assert_equal 5, TileBag.points_for(:K)
    [:J, :X].each { |x| assert_equal 8, TileBag.points_for(x) }
    [:Q, :Z].each { |x| assert_equal 10, TileBag.points_for(x) }
  end

end

class TileGroup

  attr_accessor :tiles

  def initialize
    @tiles = Array.new
  end

  def append(tile)
    @tiles.push(tile)
  end

  def remove(tile)
    @tiles.delete_at(@tiles.index(tile))
  end

  def hand
    return @tiles.join
  end

end
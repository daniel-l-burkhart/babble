class Word < TileGroup

  def initialize
    super
  end

  def score
    wordScore = 0
    @tiles.each do |tile|
      wordScore+=TileBag.points_for(tile)
    end
    return wordScore
  end

end
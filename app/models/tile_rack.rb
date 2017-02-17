require_relative 'word'

class TileRack < TileGroup

  MAX_TILES = 7

  def initialize
    super
  end

  def number_of_tiles_needed
    MAX_TILES - @tiles.size
  end

  def has_tiles_for?(text)

    word = text.upcase
    tempTiles = Array.new(@tiles)

    word.each_char { |letter|
      tileIndex = tempTiles.index(letter.to_sym)

      if tileIndex == nil
        return false
      end

      tempTiles.delete_at(tileIndex)
    }

    return true

  end

  def remove_word(text)

    text = text.upcase
    word = Word.new

    text.each_char { |letter|
      index = @tiles.index(letter.to_sym)
      tile = @tiles[index]
      word.append(tile)
      @tiles.delete_at(index)
    }

    return word
  end

end
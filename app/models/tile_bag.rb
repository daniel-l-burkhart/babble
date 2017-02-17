class TileBag

  @points = {:E => 1, :A => 1, :I => 1, :O => 1, :N => 1, :R => 1, :T => 1, :L => 1, :S => 1, :U => 1,
             :D => 2, :G => 2,
             :B => 3, :C => 3, :M => 3, :P => 3,
             :F => 4, :H => 4, :V => 4, :W => 4, :Y => 4,
             :K => 5,
             :J => 8, :X => 8,
             :Q => 10, :Z => 10
  }

  def initialize

    @bag = []

    make_tiles(:E, 12)

    [:A, :I].each do |ltr|
      make_tiles(ltr, 9)
    end

    make_tiles(:O, 8)

    [:N, :R, :T].each do |ltr|
      make_tiles(ltr, 6)
    end

    [:L, :S, :U, :D].each do |ltr|
      make_tiles(ltr, 4)
    end

    make_tiles(:G, 3)

    [:B, :C, :M, :P, :F, :H, :V, :W, :Y].each do |ltr|
      make_tiles(ltr, 2)
    end

    [:K, :J, :X, :Q, :Z].each do |ltr|
      make_tiles(ltr, 1)
    end

    @bag.shuffle!

  end

  def empty?
    return @bag.empty?
  end

  def draw_tile
    return @bag.pop
  end

  def self.points_for(tile)
    return @points[tile]
  end

  private

  def make_tiles(letter, frequency)
    frequency.times do
      @bag.push(letter)
    end
  end
end
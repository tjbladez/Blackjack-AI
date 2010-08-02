class Player
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def has_an_ace?
    @cards.select {|card| card.ace? }.size == 1
  end

  def has_a_pair?
    @cards.size == 2 && @cards.first.name == @cards.last.name
  end
end
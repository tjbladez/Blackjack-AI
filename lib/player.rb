class Player
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def possible_hand_values
    non_ace_cards = @cards.reject{|card| card.ace?}
    aces = @cards - non_ace_cards
    cards_value = non_ace_cards.map(&:value).sum
    return [cards_value] if aces.empty?

    ace_combinations = aces.map(&:value).flatten.combination(aces.size).to_a.map(&:sort).uniq
    ace_combinations.map{|ace_array| ace_array.sum + cards_value}.sort
  end

  def has_an_ace?
    !!@cards.detect {|card| card.ace? }
  end

  def has_a_pair?
    @cards.size == 2 && @cards.first.name == @cards.last.name
  end

  def has_blackjack?
    possible_hand_values.any?{|v| v == 21}
  end

  def bust?
    possible_hand_values.all? {|v| v > 21}
  end
end
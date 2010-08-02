class Deck
  attr_accessor :cards
  SUITES = [:hearts, :diamonds, :spades, :clubs]
  NAME_VALUES = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10,
    :ace   => [11, 1]}

  def initialize
    @cards = []
    SUITES.each do |suite|
      NAME_VALUES.each do |name, value|
        @cards << Card.new(suite, name, value)
      end
    end
  end

  def deal_card
    random = rand(@cards.size)
    @cards.delete_at(random)
  end
end
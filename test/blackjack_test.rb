require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A Card" do
  setup { Card.new(:hearts, :ten, 10) }
  asserts('has right suite'){ topic.suite}.equals(:hearts)
  asserts('has right name'){ topic.name}.equals(:ten)
  asserts('has right value'){ topic.value}.equals(10)
end

context "A deck" do
  setup { Deck.new }
  asserts('has 52 cards'){ topic.cards.size}.equals(52)

  context "when card is dealt" do
    setup do
      @card = topic.deal_card
      topic
    end

    asserts('random card is removed from deck') do
      !topic.cards.include?(@card)
    end
  end
end

context "A player" do
  setup { Player.new }

  asserts('starts with 0 cards'){ topic.cards.size}.equals(0)

  context "with two cards" do
    setup do
      topic.cards << Card.new(:hearts, :ten, 10)
      topic.cards << Card.new(:spades, :three, 3)
      topic
    end
    asserts('possible hand values calculated correctly'){topic.possible_hand_values}.equals(13)
  end

  context "with one ace" do
    setup do
      topic.cards << Card.new(:hearts, :ace, [11,1])
      topic.cards << Card.new(:spades, :three, 3)
      topic
    end
    asserts('has_an_ace? is true'){topic.has_an_ace?}
    asserts('possible hand values calculated correctly') do
      topic.possible_hand_values
    end.equals([14, 4].sort)
  end

  context "with 2 cards of the same denomination" do
    setup do
      topic.cards << Card.new(:hearts, :ten, 10)
      topic.cards << Card.new(:hearts, :ten, 10)
      topic
    end
    asserts('has_a_pair? is true'){topic.has_a_pair?}
  end

  context "with a bigger cards set" do
    setup do
      topic.cards << Card.new(:hearts, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :two, 2)
      topic.cards << Card.new(:spades, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :four, 4)
      topic
    end
    asserts('possible hand values calculated correctly') do
      topic.possible_hand_values
    end.equals([18, 8, 28].sort)
  end
end

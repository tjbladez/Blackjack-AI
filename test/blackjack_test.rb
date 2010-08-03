require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A Card" do
  setup { Card.new(:hearts, :ten, 10) }
  asserts(:suite).equals(:hearts)
  asserts(:name).equals(:ten)
  asserts(:value).equals(10)
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
    asserts(:possible_hand_values).equals([13])
  end

  context "with one ace" do
    setup do
      topic.cards << Card.new(:hearts, :ace, [11,1])
      topic.cards << Card.new(:spades, :three, 3)
      topic
    end
    asserts(:has_an_ace?)
    asserts(:possible_hand_values).equals([14, 4].sort)
  end

  context "with 2 cards of the same denomination" do
    setup do
      topic.cards << Card.new(:hearts, :ten, 10)
      topic.cards << Card.new(:hearts, :ten, 10)
      topic
    end
    asserts(:has_a_pair?)
  end

  context "with a bigger cards set" do
    setup do
      topic.cards << Card.new(:hearts, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :two, 2)
      topic.cards << Card.new(:spades, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :four, 4)
      topic
    end
    asserts(:possible_hand_values).equals([18, 8, 28].sort)
  end

  context "when dealt to 21 points" do
    setup do
      topic.cards << Card.new(:hearts, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :ten, 10)
      topic
    end
    asserts(:has_blackjack?)
  end

  context "when dealt more than 21 points" do
    setup do
      topic.cards << Card.new(:hearts, :nine, 9)
      topic.cards << Card.new(:hearts, :ten, 10)
      topic.cards << Card.new(:hearts, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :three, 3)
      topic
    end
    asserts(:bust?)
  end
end

require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A dealer" do
  setup { Dealer.new }
  asserts(:stands_on_soft_17)
  asserts(:blackjack_payout).equals(1.5)

  context "with two cards" do
    setup do
      topic.cards << Card.new(:hearts, :ten, 10)
      @showing_card = Card.new(:hearts, :three, 3)
      topic.cards << @showing_card
      topic
    end
    asserts("shows the second card"){ topic.showing }.equals{@showing_card}
    asserts(:showing_card_value).equals{@showing_card.value}
  end

  context "stands on soft 17 if required" do
    setup do
      topic.cards << Card.new(:hearts, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :six, 6)
      topic
    end
    asserts(:decision).equals(:s)
  end

  context "stands for values 17 and up" do
    setup do
      topic.cards << Card.new(:hearts, :ten, 10)
      topic.cards << Card.new(:hearts, :six, 6)
      topic.cards << Card.new(:hearts, :two, 2)
      topic
    end
    asserts(:decision).equals(:s)
  end

  context "hits for values less then 17" do
    setup do
      topic.cards << Card.new(:hearts, :six, 6)
      topic.cards << Card.new(:hearts, :two, 2)
      topic
    end
    asserts(:decision).equals(:h)
  end

  context "wins when dealt to blackjack" do
    setup do
      topic.cards << Card.new(:hearts, :ace, [11, 1])
      topic.cards << Card.new(:hearts, :ten, 10)
      topic
    end
    asserts(:decision).equals(:won)
  end

  context "loses when dealt more than 21 points" do
    setup do
      topic.cards << Card.new(:hearts, :six, 6)
      topic.cards << Card.new(:hearts, :ten, 10)
      topic.cards << Card.new(:hearts, :seven, 7)
      topic
    end
    asserts(:decision).equals(:lost)
  end
end
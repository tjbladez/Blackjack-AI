require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A hand" do
  setup { Hand.new }

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
  context "while getting a decision" do
    setup do
      @dealer_showing = 7
      topic
    end
    context "and having a soft values" do
      setup do
        topic.cards << Card.new(:spades, :ace, [11, 1])
        topic.cards << Card.new(:spades, :seven, 7)
        topic
      end
      should "use basic strategy for soft values" do
        topic.decision(@dealer_showing)
      end.equals(:s)
    end

    context "and having a hard values" do
      setup do
        topic.cards << Card.new(:spades, :nine, 9)
        topic.cards << Card.new(:spades, :seven, 7)
        topic
      end

      should "use basic strategy for hard values" do
        topic.decision(@dealer_showing)
      end.equals(:h)
    end

    context "and having a pair" do
      setup do
        topic.cards << Card.new(:clubs, :seven, 7)
        topic.cards << Card.new(:spades, :seven, 7)
        topic
      end

      should "use basic strategy for pairs" do
        topic.decision(@dealer_showing)
      end.equals(:sp)
    end

    context "and busted" do
      setup do
        topic.cards << Card.new(:spades, :nine, 9)
        topic.cards << Card.new(:spades, :five, 5)
        topic.cards << Card.new(:spades, :ten, 10)
        topic
      end
      should "notify a lost hand" do
        topic.decision(@dealer_showing)
      end.equals(:lost)
    end

    context "and have blackjack" do
      setup do
        topic.cards << Card.new(:spades, :ace, [11, 1])
        topic.cards << Card.new(:spades, :ten, 10)
        topic
      end
      should "notify a won hand" do
        topic.decision(@dealer_showing)
      end.equals(:won)
    end
  end
end
require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A dealer hand" do
  setup { DealerHand.new }
  context "when making a decision" do
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
end
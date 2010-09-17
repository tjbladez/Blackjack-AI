require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A player" do
  setup { Player.new }

  asserts('starts with 0 hands'){ topic.hands.size}.equals(0)

  context "when sitting down at the table" do
    setup do
      @table = Table.new
      topic.sit_down(@table)
      topic
    end
    asserts(:table).equals{@table}
    context "when making a decision" do
      setup do
        hand1 = Hand.new
        hand1.cards << Card.new(:spades, :nine, 9)
        hand1.cards << Card.new(:spades, :seven, 7)
        topic.hands << hand1

        hand2 = Hand.new
        hand2.cards << Card.new(:hearts, :seven, 7)
        hand2.cards << Card.new(:hearts, :ten, 10)
        topic.hands << hand2

        @table.dealer.hand.cards << Card.new(:hearts, :nine, 9)
        @table.dealer.hand.cards << Card.new(:diamonds, :six, 6)
        topic
      end
      should "do it for each hand" do
        topic.decision.size
      end.equals(2)
    end
  end
end
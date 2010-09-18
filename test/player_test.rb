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

    should("add itself to that table player list") do
      topic.table.players.first
    end.equals{topic}

    context "when making a decision" do
      setup do  # refactor the moment director can deal hands
        deck = Deck.new
        hand1 = Hand.new
        hand1.cards << deck.deal_card
        hand1.cards << deck.deal_card
        topic.hands << hand1

        hand2 = Hand.new
        hand2.cards << deck.deal_card
        hand2.cards << deck.deal_card
        topic.hands << hand2

        @table.dealer.hand.cards << deck.deal_card
        @table.dealer.hand.cards << deck.deal_card
        topic
      end
      asserts("do it for each hand") do
        topic.decision.size
      end.equals{topic.hands.size}
    end
  end
end
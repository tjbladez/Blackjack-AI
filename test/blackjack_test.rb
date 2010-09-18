require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A Card" do
  setup { Card.new(:hearts, :ten, 10) }
  asserts(:suite).equals(:hearts)
  asserts(:name).equals(:ten)
  asserts(:value).equals(10)
end

context "A deck" do
  setup { Deck.new }
  asserts('has 52 cards'){ topic.playable_cards.size}.equals(52)

  context "when card is dealt" do
    setup do
      @card = topic.deal_card
      topic
    end

    asserts('random card is removed from deck') do
      !topic.playable_cards.include?(@card)
    end

    context "and then shuffled" do
      setup do
        topic.shuffle
        topic
      end
      asserts('back to having 52 cards') { topic.playable_cards.size}.equals(52)
    end
  end
end

context "A table" do
  setup { Table.new }

  asserts(:dealer).kind_of(Dealer)
  asserts('has 0 players initially'){ topic.players.size}.equals(0)

  context "when adding a player" do
    setup do
      player = Player.new
      topic.add_player(player)
      topic
    end
    should("add it to a players list"){topic.players.size}.equals(1)
  end
end
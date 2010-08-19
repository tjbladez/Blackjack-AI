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
  end

  context "when shuffled" do
    setup do
      topic.deal_card
      topic.shuffle
      topic
    end
    asserts('back to having 52 cards') { topic.playable_cards.size}.equals(52)
  end
end

context "A table" do
  setup { Table.new }

  asserts(:dealer).kind_of(Dealer)
end
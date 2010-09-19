require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A dealer" do
  setup { Dealer.new }
  asserts(:blackjack_payout).equals(1.5)

  context "having a hand with cards" do
    setup do
      hand = Hand.new
      @open_card = Card.new(:hearts, :four, 4)
      hand.cards << Card.new(:hearts, :seven, 7)
      hand.cards << @open_card
      topic.hands << hand
      topic
    end
    asserts(:showing).equals{@open_card}
    asserts(:showing_card_value).equals{@open_card.value}
  end
end
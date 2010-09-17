require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A dealer" do
  setup { Dealer.new }
  asserts(:blackjack_payout).equals(1.5)

  should "have 1 hand be default" do
    topic.hands.size
  end.equals(1)

  asserts(:hand).kind_of(DealerHand)

  context "having a hand with cards" do
    setup do
      @open_card = Card.new(:hearts, :four, 4)
      topic.hand.cards << Card.new(:hearts, :seven, 7)
      topic.hand.cards << @open_card
      topic
    end
    asserts(:showing).equals{@open_card}
    asserts(:showing_card_value).equals{@open_card.value}
  end
end
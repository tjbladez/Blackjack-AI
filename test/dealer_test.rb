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
  end
end
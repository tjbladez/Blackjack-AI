class Dealer < Player
  attr_reader :blackjack_payout

  def initialize
    super
    @blackjack_payout  = 1.5
    @hands << DealerHand.new
  end

  def showing
    hand.cards[1]
  end

  def showing_card_value
    showing.value
  end

  #Dealer only allowed to have one hand
  def hand
    hands.first
  end

  def decision
    @hands.first.decision
  end
end
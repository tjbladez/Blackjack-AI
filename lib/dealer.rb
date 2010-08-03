class Dealer < Player
  attr_accessor :stands_on_soft_17, :blackjack_payout

  def initialize
    @stands_on_soft_17 = true
    @blackjack_payout  = 1.5
    super
  end

  def showing
    cards[1]
  end
end
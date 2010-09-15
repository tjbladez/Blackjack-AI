class Dealer < Player
  attr_reader :stands_on_soft_17, :blackjack_payout

  def initialize
    @stands_on_soft_17 = true
    @blackjack_payout  = 1.5
    super
  end

  def showing
    cards[1]
  end

  def showing_card_value
    cards[1].value
  end

  def decision
    return :lost if bust?
    return :won if has_blackjack?

    return :s if has_soft_17? && @stands_on_soft_17
    if possible_hand_values.all? {|v| v >= 17 }
      :s
    else
      :h
    end
  end

private
  def has_soft_17?
    has_an_ace? && possible_hand_values.detect{|v| v == 17 } && possible_hand_values.detect {|v| v < 17}
  end
end
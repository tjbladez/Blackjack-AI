class DealerHand < Hand
  def decision
    return :lost if bust?
    return :won if has_blackjack?

    return :s if has_soft_17?
    if possible_hand_values.all? {|v| v >= 17 }
      :s
    else
      :h
    end
  end
end
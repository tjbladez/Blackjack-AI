class Player
  attr_accessor :hands, :table

  def initialize
    @hands = []
  end

  def sit_down(table)
    @table = table
  end

  def decision
    @hands.map {|hand| hand.decision(@table.dealer.showing_card_value)}
  end
end
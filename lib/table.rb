class Table
  attr_accessor :players, :dealer

  def initialize
    @dealer = Dealer.new
    @players = []
  end

  def add_player(player)
    @players << player
  end
end
class Table
  attr_accessor :players, :dealer

  def initialize
    @dealer = Dealer.new
    @players = []
  end
end
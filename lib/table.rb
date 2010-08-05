class Table
  attr_accessor :players, :dealer

  def initialize
    @dealer = Dealer.new
  end
end
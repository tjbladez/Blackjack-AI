class Director
  class << self
    attr_accessor :table, :deck, :players
    def new
      @table = Table.new
      @deck = Deck.new
      @players = []
    end

    def add_player
      @players << Player.new
    end
  end
end
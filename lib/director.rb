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

    def deal_hand(person)
      hand = Hand.new
      hand.cards << deck.deal_card
      hand.cards << deck.deal_card
      person.hands << hand
    end

    def dealer
      table.dealer
    end
  end
end
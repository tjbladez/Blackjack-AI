require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A director" do
  setup { Director.new; Director }

  asserts(:table).kind_of(Table)
  asserts(:deck).kind_of(Deck)

  should("starts with 0 players"){ topic.players.size}.equals(0)

  context "when adding a player" do
    setup { topic.add_player; topic }

    should("add it to a players list"){topic.players.size}.equals(1)
    should("be a Player class"){topic.players.first}.kind_of(Player)
  end

end
require File.join(File.dirname(__FILE__), '..', 'blackjack')

context "A Card" do
  setup { Card.new(:hearts, :ten, 10) }
  asserts('has right suite'){ topic.suite}.equals(:hearts)
  asserts('has right name'){ topic.name}.equals(:ten)
  asserts('has right value'){ topic.value}.equals(10)
end

context "A deck" do
  setup { Deck.new }
  asserts('has 52 cards'){ topic.cards.size}.equals(52)
end

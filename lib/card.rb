class Card
  attr_accessor :suite, :name, :value

  def initialize(suite, name, value)
    @suite, @name, @value = suite, name, value
  end

end
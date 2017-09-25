require_relative 'card'
class Deck
  attr_accessor :suits
  attr_accessor :values
  attr_accessor :cards

  def initialize
    @suits = ['diamonds', 'spades', 'hearts', 'clubs']
    @values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    @cards = []

    @suits.each do |suit|
      @values.each do |value|
        @cards.push(Card.new(suit,value))
      end
    end
  end

  def deal
    card = rand(@cards.length-1)
    @cards.delete(card)
    return card
  end

  def shuffle
    @cards = []

    @suits.each do |suit|
      @values.each do |value|
        @cards.push(Card.new(suit,value))
      end
    end
  end
end

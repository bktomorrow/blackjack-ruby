require_relative 'card'
class Player
  attr_accessor :hand

  def initialize(card1, card2)
    @hand = []
    @hand.push(card1)
    @hand.push(card2)
  end

  def deal(card)
    @hand.push(card)
  end

  def newHand(card1, card2)
    @hand = []
    @hand.push(card1)
    @hand.push(card2)
  end
end

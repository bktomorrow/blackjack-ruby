require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/dealer'

puts "Hello and welcome to the game of blackjack."

@money = 100

while @money >= 10 do
  puts "You have $#{@money} and bet $10."
  deck = Deck.new()
  player = Player.new(deck.cards[deck.deal].value, deck.cards[deck.deal].value)
  initialValue = player.hand[0] + player.hand[1]
  puts "You have a #{player.hand[0]} and a #{player.hand[1]} Your total is #{initialValue}."
  print "Do you want to (h)it or (s)tand?"
  answer = gets.chomp.downcase

  while answer !=  "s" do
    handString = ""
    initialValue = 0
    player.deal(deck.cards[deck.deal].value)

    player.hand.each do |card|
      handString  = handString + card.to_s + ", "
      initialValue = initialValue + card
    end

    puts "You have a #{handString} Your total is #{initialValue}."

    if initialValue < 21
      print "Do you want to (h)it or (s)tand?"
      answer = gets.chomp.downcase
    else
      answer = "s"
    end

    if answer == "q"
      hellp = "hello"
      hellp = hellp + 2
    end
  end

  puts "You stand. Your total is #{initialValue}."
  dealer = Dealer.new(deck.cards[deck.deal].value, deck.cards[deck.deal].value)
  dealerValue = dealer.hand[0] + dealer.hand[1]
  if initialValue < 22
    while dealerValue < initialValue do
      puts "The dealer hits."
      dealer.deal(deck.cards[deck.deal].value)
      dealerValue = 0

      dealer.hand.each do |card|
        dealerValue = dealerValue + card
      end
    end
  end
  if dealerValue < 22
    puts "The dealer stands. The dealer had a total of #{dealerValue} You lose!"
    @money = @money - 10
    puts "_____________________"

  else
    puts "The dealer stands. The dealer had a total of #{dealerValue} You Win!"
    @money = @money + 10
    puts "_____________________"
  end

end

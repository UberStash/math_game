require './player.rb'
require './question.rb'

class Game
  def initialize
    puts "What is player 1's name?"
    player1 = gets.chomp
    @player1 = Player.new(player1)
    puts "What is player 2's name?"
    player2 = gets.chomp
    @player2 = Player.new(player2)
  end

  

  def createQuestion
    @question = Question.new
    if @player1.turn
      puts "#{@player2.name}: #{@question.question}"  
    else 
      puts "#{@player1.name}: #{@question.question}"  
    end
  end




  def nextTurn
    createQuestion
   
  end


end


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
    puts "Answer the questions first player to 0 loses"
  end

  

  def createQuestion
    @question = Question.new
    if @player1.turn
      puts "#{@player1.name}: #{@question.question}"  
    else 
      puts "#{@player2.name}: #{@question.question}"  
    end
  end

  def checkAnswer
    if gets.chomp.to_i == @question.answer
      if @player1.turn
        puts "YES correct."
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives} vs #{@player2.name}: #{@player2.lives}"
        checkWinner
      else
        puts "YES correct."
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives} vs #{@player2.name}: #{@player2.lives}"
        checkWinner
      end
    else
      if @player1.turn
        @player1.lives -= 1
        puts "No That is Wrong"
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      else
        @player2.lives -= 1
        puts "No That is Wrong."
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      end    
    end
  end

  def checkWinner
    if @player1.lives == 0
      puts "GAME OVER"
      puts "#{@player2.name} wins with a score of #{@player2.lives} "
    elsif @player2.lives == 0
      puts "GAME OVER"
      puts "#{@player1.name} wins with a score of #{@player1.lives} "
    else
      nextTurn
    end
  end

  def nextTurn
    createQuestion
    checkAnswer
  end


end


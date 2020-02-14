# player 1 - "X"
# player 2 - "O" (capital o)

def display_initial_board(board)
    puts " 1 | 2 | 3 "
    puts " ---------"
    puts " 4 | 5 | 6 "
    puts " ---------"
    puts " 7 | 8 | 9 "
end

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts " ---------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts " ---------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def isEmpty?(board, input)
    if board[input-1] == " "
        return true
    else
        return false
    end
end

def turnForPlayer(board, player = "X")

    puts "Turn for Player #{player}"
    input = gets.chomp.to_i

    while input<1 || input>9
        puts "invalid input, enter value between 1 to 9"
        input = gets.chomp.to_i
    end
    
    if isEmpty?(board,input)
        board[input-1] = player
        display_board(board)
    else
        puts "Space already occupied"
        turnForPlayer(board, player)
    end



end

def turnForPlayerA(board)
    puts "Turn for Player A"
    input = gets.chomp.to_i

    while input<=0 || input>9
        puts "invalid input, enter value between 1 to 9"
        input = gets.chomp.to_i
    end
    
    if isEmpty?(board,input)
        board[input-1] = "X"
        display_board(board)
    else
        puts "Space already occupied"
        turnForPlayerA(board)
    end

end

def turnForPlayerB(board)
    puts "Turn for Player B"
    input = gets.chomp.to_i
    while input<=0 || input>9
        puts "invalid input, enter value between 1 to 9"
        input = gets.chomp.to_i
    end
    
    if isEmpty?(board,input)
        board[input-1] = "O"
        display_board(board)
    else
        puts "Space already occupied"
        turnForPlayerB(board)
    end
end

def getCount(board)
   count = 0
   for i in board do
        if i=="X" || i=="O"
            count +=1
        end
    end
    return count
end

def playerWon?(board)

    if  ( board[0] == "X" && board[1] == "X" && board[2] == "X" ) ||
        ( board[3] == "X" && board[4] == "X" && board[5] == "X" ) ||
        ( board[6] == "X" && board[7] == "X" && board[8] == "X" ) ||
        ( board[0] == "X" && board[3] == "X" && board[6] == "X" ) ||
        ( board[1] == "X" && board[4] == "X" && board[7] == "X" ) ||
        ( board[2] == "X" && board[5] == "X" && board[8] == "X" ) ||
        ( board[0] == "X" && board[4] == "X" && board[8] == "X" ) ||
        ( board[2] == "X" && board[4] == "X" && board[6] == "X" ) ||

        ( board[0] == "O" && board[1] == "O" && board[2] == "O" ) ||
        ( board[3] == "O" && board[4] == "O" && board[5] == "O" ) ||
        ( board[6] == "O" && board[7] == "O" && board[8] == "O" ) ||
        ( board[0] == "O" && board[3] == "O" && board[6] == "O" ) ||
        ( board[1] == "O" && board[4] == "O" && board[7] == "O" ) ||
        ( board[2] == "O" && board[5] == "O" && board[8] == "O" ) ||
        ( board[0] == "O" && board[4] == "O" && board[8] == "O" ) ||
        ( board[2] == "O" && board[4] == "O" && board[6] == "O" ) 

        return true
    else
        return false
    end
end

def gameEnd?(board)

    if getCount(board) == 9
        return true
    end
    
    return false
end

def play(board)

    display_initial_board(board)
    puts "Player A = X"
    puts "Player B = O"

    while true
        turnForPlayer(board, "X")
        if playerWon?(board)
            puts "Player A won"
            exit
        elsif gameEnd?(board)
            puts "tie"
            exit
        end
        turnForPlayer(board,"O")
        if playerWon?(board)
            puts "Player B won"
            exit
        elsif gameEnd?(board)
            puts "tie"
            exit
        end
    end
end


board = [" "," "," "," "," "," "," "," "," "]
play(board)
import 'dart:math';
import 'dart:io';

void main() {
  var gameBoard = TicTacToe();
  // gameBoard.chooseMove(3);
  // print(gameBoard);
  // gameBoard.computerMove();
  // gameBoard.chooseMove(5);
  // print(gameBoard);
  // gameBoard.computerMove();
  // print(gameBoard);
  // gameBoard.chooseMove(4);
  // print(gameBoard);
  // gameBoard.computerMove();
  // print(gameBoard);
  // gameBoard.chooseMove(7);
  // print(gameBoard);
  // gameBoard.computerMove();
  // print(gameBoard);
  gameBoard.playGame();
}

class TicTacToe {
  var board = List.filled(9, '🔲');

  void chooseMove(pos) => {
        if (board[pos] == '🔲')
          {board[pos] = '❌'}
        else
          {print('That spot is already taken silly!\n')}
      };

  void computerMove() {
    var choice = new Random().nextInt(9);
    if (board[choice] == '🔲') {
      board[choice] = '⭕';
    } else if (board.contains('🔲')) {
      computerMove();
    } else {
      print('There are no more moves left!\n');
    }
  }

  void playGame() {
    print(this);
    var win = checkForWin();
    while (win == '') {
      chooseMove(int.parse(stdin.readLineSync()!));
      computerMove();
      print(this);
    }
  }

  String checkForWin() {
    return '';
  }

  @override
  String toString() {
    var out = '';
    for (int i = 1; i <= board.length; i++) {
      out += i % 3 == 0 ? '${board[i - 1]}\n' : '${board[i - 1]}';
    }
    return out;
  }
}

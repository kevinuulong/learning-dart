import 'dart:math';
import 'dart:io';

void main() {
  var gameBoard = TicTacToe();
  gameBoard.playGame();
}

class TicTacToe {
  // TODO: Should probably just make this 2d
  var board = List.filled(9, '🔲');

  void chooseMove(pos) => {
        if (board[pos] == '🔲')
          {board[pos] = '❌'}
        else
          {print('That spot is already taken silly!\n')}
      };
  // TODO: Make computer not just entirely random
  void computerMove() {
    var choice = findThreat() == -1 ? Random().nextInt(9) : findThreat();
    if (board[choice] == '🔲') {
      board[choice] = '⭕';
    } else if (board.contains('🔲')) {
      computerMove();
    }
  }

  void playGame() {
    print(this);
    while (checkForWin() == '') {
      chooseMove(int.parse(stdin.readLineSync()!));
      computerMove();
      print(this);
    }
    String win = checkForWin();
    print(win == 'tie' ? 'tie' : '$win won!');
  }

  String checkForWin() {
    var board2d = [
      board.sublist(0, 3),
      board.sublist(3, 6),
      board.sublist(6, 9)
    ];
    // Check for horizontal victory
    for (List<String> element in board2d) {
      if (element.every((element) => element == '❌')) return '❌';
      if (element.every((element) => element == '⭕')) return '⭕';
    }
    // Check for vertical victory
    for (int i = 0; i < board2d.length; i++) {
      // TODO: look into simplifying this
      var column = [board2d[0][i], board2d[1][i], board2d[2][i]];
      if (column.every((element) => element == '❌')) return '❌';
      if (column.every((element) => element == '⭕')) return '⭕';
    }
    // Check for diagonal victory
    // TODO: Probably a cleaner way to find these
    var diagonals = [
      [board2d[0][0], board2d[1][1], board2d[2][2]],
      [board2d[0][2], board2d[1][1], board2d[2][0]]
    ];
    for (List<String> element in diagonals) {
      if (element.every((element) => element == '❌')) return '❌';
      if (element.every((element) => element == '⭕')) return '⭕';
    }
    // Check for no victor
    if (!board.contains('🔲')) return 'tie';
    return '';
  }

  int findThreat() {
    var board2d = [
      board.sublist(0, 3),
      board.sublist(3, 6),
      board.sublist(6, 9)
    ];
    for (int i = 0; i < board2d.length; i++) {
      if (_countInList(board2d[i], '❌') == 2) {
        print(board2d[i]);
        return _convertTo1d(i, board2d[i].indexOf('🔲'));
      }
    }
    return -1;
  }

  int _countInList(List list, value) {
    int out = 0;
    list.forEach((element) {
      out += element == value ? 1 : 0;
    });
    return out;
  }

  int _convertTo1d(i, j) {
    print(i * 3 + j);
    return i * 3 + j;
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

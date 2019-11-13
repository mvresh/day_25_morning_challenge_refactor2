// Challenge 1
// Write Test cases for given challenges

// Challenge 2
// Sudoku Validation
// Write a sudoku validator. This function should return true if the 2-D array represents a valid sudoku and false otherwise. To be a valid sudoku:
//
// - Each row must have the digits from 1 to 9 exactly once.
// - Each column must have the digits from 1 to 9 exactly once.
// - Each 3x3 box must have the digits from 1 to 9 exactly once.
// Examples
//  sudokuValidator([
//  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
//  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
//  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
//  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
//  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
//  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
//  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
//  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
//  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
//  ]) ➞ true
bool sudokuValidator(List<List> board) {
  return isSudokuBoardOfRightSize(board) &&
      doCellsContainValidNumber(board) &&
      checkRowCol(board) &&
      checkBoxes(board);
}

//lets check if the board is valid or not first
// that is, size of the board should be multiple of 3
bool isSudokuBoardOfRightSize(List<List> board) {
//  for (List row in board) {
//    if (row.length % 3 != 0 && board.length % 3 != 0) {
//      return false;
//    }
//  }

  return board.every((row) =>
  row.length % 3 == 0 && row.length == board.length);
  print('right size');
  return true;
}

//now lets check if the sudokuBoard contains valid numbers as per its size
bool doCellsContainValidNumber(List<List> board) {
//  int length =
//      board.length; //length of board or number of rows in board and their size
  //so all numbers should be form 0 to length
//  for (int row = 0; row < length; row++) {
//    for (int col = 0; col < length; col++) {
//      if (board[row][col] > length ||
//          board[row][col] < 0 ||
//          board[row][col] == 0) {
//        return false;
//      }
//    }
//  }

  List allCells = board.expand((item) => item).toList();
  return allCells.every((cell) => cell < board.length + 1 && cell > 0);
  print('valid numbers');
  return true;
}

bool containsDuplicateElements(List list) =>
    list
        .toSet()
        .length != list.length;
//now lets check each row and also each column for duplicates
bool checkRowCol(List<List<int>> board) {
  int length = board.length;
  //checking rows first
  if (board.any((List<int> row) => containsDuplicateElements(row))) {
    return false;
  }

  //checking columns
  for (int col = 0; col < length; col++) {
    List colElementsList = board.map((List<int> row) => row[col]).toList();
//    for (int row = 0; row < length; row++) {
//      colElementsList.add(board[row][col]);
//    }
    if (containsDuplicateElements(colElementsList)) {
      return false;
    }
  }

  print('row & col uniqe');
  return true;
}

//now lets check if all the subBoards of size 3
//don't have any repeating numbers
bool checkBoxes(List<List> board) {
  for (int row = 0; row < board.length; row = row + 3) {
    for (int col = 0; col < board.length; col = col + 3) {
//      print('row $row col $col');
      if (!isBoardBoxValid(board, row, col)) {
        return false;
      }
    }
  }


  print('all boxes unique');
  return true;
}

bool isBoardBoxValid(List<List> board, int rowPos, int colPos) {
  List elements = [];

  for (int row = rowPos; row < rowPos + 3; row++) {
    for (int col = colPos; col < colPos + 3; col++) {
      elements.add(board[row][col]);
    }
  }
//  print(elements); // debug print statement
  if (elements.toSet().length != board.length) {
    return false;
  }
  return true;
}

// Challenge 3
// Sort by Factor Length
// A numbers factor length is simply its total number of factors.
// Create a function that sorts an array by factor length in descending order.
// If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.
//
// In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.
//
// factorSort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]
List factorSort(List numbers) {
  numbers.sort((a, b) => countFactors(a).compareTo(countFactors(b)));
  return numbers.reversed.toList();
}

int countFactors(int number) {
  int count = 0;
  for (int i = 1; i <= number; i++) {
    number % i == 0 ? count++ : null;
  }

  return count;
}

box(board) =>
    board.isEmpty ? board : [board.take(3)]..addAll(box(board.skip(3)));
main() {
//  print(countElementInList([1, 5, 2, 4, 1, 9, 3, 7, 6], 1));
  List<List> board = [
    [1, 5, 2, 4, 8, 9, 3, 7, 6],
    [7, 3, 9, 2, 5, 6, 8, 4, 1],
    [4, 6, 8, 3, 7, 1, 2, 9, 5],
    [3, 8, 7, 1, 2, 4, 6, 5, 9],
    [5, 9, 1, 7, 6, 3, 4, 2, 8],
    [2, 4, 6, 8, 9, 5, 7, 1, 3],
    [9, 1, 4, 6, 3, 7, 5, 8, 2],
    [6, 2, 5, 9, 4, 8, 1, 3, 7],
    [8, 7, 3, 5, 1, 2, 9, 6, 4]
  ];
//  print(sudokuValidator(board));


  print(box(board));
}

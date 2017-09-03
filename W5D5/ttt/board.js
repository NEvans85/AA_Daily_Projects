class Board {
  constructor() {
    this.boardState = [[], [], []];
  }

  printBoard() {
    console.log(this.boardState[0]);
    console.log(this.boardState[1]);
    console.log(this.boardState[2]);
  }

  columns() {
    const result = [[], [], []];
    for (var i = 0; i < this.boardState.length; i++) {
      for (var j = 0; j < this.boardState[i].length; j++) {
        result[j].push(this.boardState[i][j]);
      }
    }
    return result;
  }

  diagonals() {
    return [
      [this.boardState[0][0], this.boardState[1][1], this.boardState[2][2]],
      [this.boardState[0][2], this.boardState[1][1], this.boardState[2][0]]
    ];
  }

  rows() {
    this.boardState;
  }
}

module.exports(Board);

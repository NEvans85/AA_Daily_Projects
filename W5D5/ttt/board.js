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
    const columns = [[], [], []];
    for (var i = 0; i < this.boardState.length; i++) {
      for (var j = 0; j < this.boardState[i].length; j++) {
        columns[j].push(this.boardState[i][j]);
      }
    }
    return columns;
  }

  diagonals() {
    return [
      [this.boardState[0][0], this.boardState[1][1], this.boardState[2][2]],
      [this.boardState[0][2], this.boardState[1][1], this.boardState[2][0]]
    ];
  }

  lines() {
    return this.boardState.concat(this.diagonals()).concat(this.columns());
  }

  winningLine(line) {
    if (line[0] && line[0] === line[1] && line[0] === line[2]) {
      return line[0];
    } else {
      return false;
    }
  }

  placeMark(mark, pos) {
    if (this.boardState[pos[0]][pos[1]]) {
      return false;
    } else {
      this.boardState[pos[0]][pos[1]] = mark;
      return true;
    }
  }

  winningBoard() {
    let result = false;
    this.lines().forEach(line => {
      if (this.winningLine(line)) {
        result = this.winningLine(line);
      }
    });
    return result;
  }
}

module.exports = Board;

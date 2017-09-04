const Board = require("./board.js");

class Game {
  constructor(reader) {
    this.reader = reader;
    this.board = new Board();
    this.currentPlayer = "X";
  }

  switchPlayer() {
    console.log("Got there");
    this.currentPlayer === "X"
      ? (this.currentPlayer = "O")
      : (this.currentPlayer = "X");
  }

  run(reader, completionCallback) {
    if (!this.board.winningBoard()) {
      this.board.printBoard();
      console.log("Make a move.");
      reader.question("Which row?", rowInput => {
        const moveRow = parseInt(rowInput);
        reader.question("Which column?", colInput => {
          const moveCol = parseInt(colInput);
          if (this.board.placeMark(this.currentPlayer, [moveRow, moveCol])) {
            console.log("gonna run it");
            this.switchPlayer();
          } else {
            console.log("Invalid Move");
          }
          this.run(reader, completionCallback);
        });
      });
    } else {
      console.log("Game Over");
      this.board.printBoard();
      console.log(`${this.board.winningBoard()} is the winner!`);
      completionCallback();
    }
  }
}

module.exports = Game;

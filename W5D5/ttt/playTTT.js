const Game = require("./game.js");
const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let game = new Game();
game.run(reader, completeGame);

function completeGame() {
  reader.question("Play again? (y or n)", function playAgain(response) {
    if (response === "y") {
      g = new Game();
      g.run(reader, completeGame);
    } else {
      reader.close();
    }
  });
}

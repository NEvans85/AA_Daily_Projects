class Game {
  constructor() {
    this.towers = [[3, 2, 1], [], []];
  }

  run(reader, completionCallback) {
    // until solved
    // get move from player (from, to)
    // make the move
    this.promptMove(reader, function(startTowerIdx, endTowerIdx) {
      if (!this.move(startTowerIdx, endTowerIdx)) {
        console.log("Invalid Move.");
      } else {
        if (!solved) {
          this.run(reader, completionCallback);
        } else {
          this.print();
          console.log("WINNER!");
          completionCallback;
        }
      }
    });
  }

  solved() {
    return this.towers[1].length === 3 || this.towers[2].length === 3;
  }

  promptMove(reader, callback) {
    // print the stacks
    this.print();
    // get move from user
    reader.question("Enter The Tower To Move From: ", function(start) {
      const startTowerIdx = parseInt(start);
      reader.question("Enter The Tower To Move To: ", function(end) {
        const endTowerIdx = parseInt(end);
        callback(startTowerIdx, endTowerIdx);
      });
    });
    // run callback with fromIndex and toIndex
  }

  print() {
    console.log(this.towers);
  }

  isValidMove(fromIndex, toIndex) {
    let towerFrom = this.towers[fromIndex];
    let towerTo = this.towers[toIndex];

    if (towerFrom.length === 0) {
      return false;
    }
    if (towerTo.length !== 0) {
      let diskFrom = towerFrom.slice(-1);
      let diskTo = towerTo.slice(-1);
      if (diskFrom > diskTo) return false;
    }
    return true;
  }

  move(fromIndex, toIndex) {
    if (this.isValidMove(fromIndex, toIndex)) {
      this.towers[toIndex].push(this.towers[fromIndex].pop());
      return true;
    }
    return false;
  }
}

module.exports = Game;

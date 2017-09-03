Array.prototype.uniq = function() {
  const results = [];
  for (let i = 0; i < this.length; i++) {
    if (!results.includes(this[i])) {
      results.push(this[i]);
    }
  }
  return results;
};

Array.prototype.toSum = function() {
  const results = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        results.push([i, j]);
      }
    }
  }
  return results;
};

Array.prototype.transpose = function() {
  const results = [];
  for (let i = 0; i < this[0].length; i++) {
    results.push([]);
  }
  for (let row = 0; row < this.length; row++) {
    for (let col = 0; col < this[row].length; col++) {
      results[col][row] = this[row][col];
    }
  }
  return results;
};

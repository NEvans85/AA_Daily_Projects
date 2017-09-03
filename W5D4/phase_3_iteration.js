Array.prototype.bubbleSort = function bubbleSort(callback) {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (callback(this[i], this[i + 1]) === 1) {
        const lesser = this[i + 1];
        this[i + 1] = this[i];
        this[i] = lesser;
        sorted = false;
      }
    }
  }
  return this;
};

function standardSort(num1, num2) {
  return Math.sign(num1 - num2);
}

String.prototype.substrings = function substrings() {
  const result = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      result.push(this.slice(i, j));
    }
  }
  return result;
};

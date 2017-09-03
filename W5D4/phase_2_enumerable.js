Array.prototype.myEach = function myEach(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

function printIt(string) {
  console.log(string);
}

Array.prototype.myMap = function myMap(callback) {
  const results = [];
  this.myEach(function(num) {
    results.push(callback(num));
  });
  return results;
};

function squareIt(num) {
  return num * num;
}

Array.prototype.myReduce = function myReduce(callback, initialValue) {
  let toReduce = [];
  if (initialValue === undefined) {
    initialValue = this[0];
    toReduce = this.slice(1);
  } else {
    toReduce = this;
  }
  let accumulator = initialValue;
  toReduce.myEach(function(num) {
    accumulator = callback(accumulator, num);
  });
  return accumulator;
};

function reduceAdd(acc, el) {
  return acc + el;
}

function range(start, end) {
  if (start === end) {
    return [end];
  }
  return [start].concat(range(start + 1, end));
}

function sumRec(arrOfNums) {
  if (arrOfNums.length === 1) {
    return arrOfNums[0];
  }
  return arrOfNums[0] + sumRec(arrOfNums.slice(1));
}

function exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent1(base, exp - 1);
}

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
  if (exp === 1) {
    return base;
  }
  if (exp % 2 === 0) {
    return (exponent2(base, exp / 2)) * (exponent2(base, exp / 2));
  }
  else {
    return base *
           exponent2(base, (exp - 1) / 2) *
           exponent2(base, (exp - 1) / 2);
  }
}

function fibonacci(n) {
  if (n === 1) {
    return [0];
  }
  if (n === 2) {
    return [0, 1];
  }
  const lastFib = fibonacci(n - 1);
  return lastFib.concat([lastFib[lastFib.length - 1] +
                         lastFib[lastFib.length - 2]]);
}

function bsearch(arr, target) {
  if (arr.length === 1 && target !== arr[0]) {
    return -1;
  }
  let midpoint = Math.floor(arr.length / 2);
  switch (Math.sign(arr[midpoint] - target)) {
    case 1:
      return bsearch(arr.slice(0, midpoint), target);
    case 0:
      return midpoint;
    case -1:
      return bsearch(arr.slice(midpoint + 1, arr.length), target) + midpoint + 1;
  }
}


function merge(arr1, arr2) {
  debugger;
  const results = [];
  while (arr1.length > 0 && arr2.length > 0) {
    switch (Math.sign(arr1[0] - arr2[0])) {
      case 1:
        results.push(arr2.shift());
        break;
      case -1:
        results.push(arr1.shift());
        break;
      case 0:
        results.push(arr1.shift(), arr2.shift());
        break;
    }
  }
  results.concat(arr1, arr2);
  return results;
}

function mergesort(arr) {
  if (arr.length === 1) {
    return arr;
  }
  let midpoint = Math.floor(arr.length / 2);
  return merge(mergesort(arr.slice(0, midpoint)), mergesort(arr.slice(midpoint)));
}

merge([5], [7]);

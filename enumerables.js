Array.prototype.myEach = function (func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }

  return this;
};

const NUMS = [1, 2, 3, 4, 5];

Array.prototype.myInject = function (func) {
  let result = this[0];

  this.slice(1).myEach(function(element) {
    result = func(result, element);
  });

  return result;
};

console.log(NUMS.myInject( (total, item) => total + item ));

function bubbleSort (arr) {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        let oldi = arr[i];
        let oldiplus = arr[i+1];
        arr[i] = oldiplus;
        arr[i+1] = oldi;
        sorted = false;
      }
    }
  }
  return arr;
}

// console.log(bubbleSort([1,5,2,3,99,-3]));


function substrings(string) {
  let results = [];
  for(let i = 0; i < string.length; i++) {
    for(let j = i; j < string.length; j++) {
      results.push(string.slice(i, j + 1));
    }
  }
  return results;
}
// console.log(substrings(" s;alkdfjafldkjdslkjffis fids"));

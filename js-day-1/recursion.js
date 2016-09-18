// function range (start, end) {
//   if (start === end) {
//     return [start];
//   }
//
//   // let prev = range(start, end - 1);
//   // prev.push(end);
//   // return prev;
//
//   let result = [start].concat(range(start + 1, end));
//   return result;
// }
//
// // console.log(range(2, 20));
// //
// // def range(start, end)
// //   return 1 if end == 1
// //   return 1, 2 if end == 2
// //   return 1, 2, 3 if end == 3
// //
// //   previous = range(1, end - 1)
// //   return previous << end
// // end
//
// function sumOfArr (arr) {
//   if (arr.length <= 1) {
//     return arr[0];
//   }
//
//   return arr[0] + sumOfArr(arr.slice(1));
// }
//
// // console.log(sumOfArr([1, 2, 3]));
//
// // def exp(base, exp)
// //   base = 3
// //   return 1 if exp == 0
// //   return 3 if exp == 1
// //   return 9 if exp == 2
// //   return 27 if exp == 3
// //
// //   return 1 if power = 0
// //   return base if power = 1
// //
// //   prev = exp(base, exp - 1)
// //   return prev * base
// // end
//
//
// function exp(base, power) {
//   if(power === 0) return 1;
//   let prev = exp(base, power - 1);
//   return prev * base;
// }
//
// // console.log(exp(7,22));
//
// function fib(n) {
//
//   if (n === 1) return [1];
//   if (n === 2) return [1, 1];
//
//   let prev = fib (n - 1);
//   let nextNum = prev[prev.length - 1] + prev[prev.length-2];
//   prev.push(nextNum);
//   return prev;
// }

// console.log(fib(12));

function bsearch(arr, target) {
  let half = Math.floor(arr.length / 2);
  if (arr[half] === target) return half;
  if (arr.length <= 1) return null;
  let left = arr.slice(0, half);
  let right = arr.slice(half, arr.length);
  if (arr[half] > target) {
    return bsearch(left, target);
  } else {
    return bsearch(right, target) + half;
  }

}

// console.log(bsearch([1, 2, 3, 4, 5, 6, 67, 10762364], 10762364));

function Cat (name, owner) {
  this.name = name;
  this.owner = owner;
  this.cuteStatement = function() {
    return `${this.owner} loves ${this.name}`;
  };
}

// Cat.prototype.cuteStatement = function() {
//   return `${this.owner} loves ${this.name}`;
// };

let c = new Cat ("Burfie", "Lard");
let d = new Cat ("garGOYLE", "tubbs");

Cat.prototype.cuteStatement = function() {
  return `Everybody loves ${this.name}`;
};

d.cuteStatement = function(){
  return `Nobody loves ${this.name}`;
};

console.log(c.cuteStatement());
console.log(d.cuteStatement());

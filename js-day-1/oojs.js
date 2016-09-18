function titleize(arr) {
  let titleized = arr.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  titleized.forEach(el => console.log(el));
}

// titleize(["Mary", "Brian", "Leo"]);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;

  this.addTrick = function (trick) {
    this.tricks.push(trick);
  };

  this.play = function () {
    let rand = Math.floor(Math.random() * 1000) % self.tricks.length;
    return `${self.name} is ${self.tricks[rand]}!`;
  };
}

Elephant.prototype.trumpet = function () {
  return (`${this.name} the elephant goes phrRRRRRRR!!!!`);
};

Elephant.prototype.grow = function () {
  this.height += 1;
};

// Elephant.prototype.trumpet = function () {
//   return (`${this.name} the elephant goes phrRRRRRRR!!!!`);
// };
//
let a = new Elephant("Burfie", 24, ["eating an apple"]);
a.grow();
a.grow();
a.addTrick("rolling over");
console.log(a.height);
console.log(a.tricks);
console.log(a.__proto__);

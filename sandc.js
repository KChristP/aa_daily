function Student(firstName, lastName){
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}
Student.prototype.name = function() {
  return this.firstName + this.lastName;
};

// Student.prototype.courses =  function() {
//   this.courses
// };
Student.prototype.enroll = function(course) {
  this.courses.push(course);
};

Student.prototype.courseLoad = function() {
  let deptLoadHash = {};
  this.courses.forEach(function(course) {
    if (deptLoadHash[course.department] === undefined) {
      deptLoadHash[course.department] = course.credits;
    } else {
      deptLoadHash[course.department] += course.credits;
    }
  });
  return deptLoadHash;
};





function Course(name, department, credits){
  this.name = name;
  this.department = department;
  this.credits = credits;
}

let s1 = new Student ("bob", "charles");
let s2 = new Student ("barkley", "john");
let c1 = new Course ("Hypnosis", "theology", 7);
let c2 = new Course ("biscuits", "umami", 17);
let c3 = new Course ("Salami", "umami", 9);

s1.enroll(c1);
s1.enroll(c2);
s1.enroll(c3);

console.log(s1.courseLoad());

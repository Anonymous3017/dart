class Employee {
  var name;
  var age;
  var designation;
  var salary;
  var grade;
}

class Designer extends Employee {
  designUI() {
    print('${this.name} is designing UI');
  }

  postSocialMedia() {
    print('${this.name} is posting on social media');
  }
}

class Developer extends Employee {
  developSoftware() {
    print('${this.name} is developing software');
  }

  pushToGithub() {
    print('${this.name} is pushing code to Github');
  }
}

void main() {
  var emp1 = Designer();
  emp1.name = 'Ayush';
  emp1.age = 20;
  emp1.designation = 'Designer';
  emp1.salary = 25000;
  emp1.grade = 'A';
  print('Name: ${emp1.name}');
  print('Age: ${emp1.age}');
  print('Designation: ${emp1.designation}');
  print('Salary: ${emp1.salary}');
  print('Grade: ${emp1.grade}');
  emp1.designUI();
  emp1.postSocialMedia();

  var emp2 = Developer();
  emp2.name = 'Ayush';
  emp2.age = 20;
  emp2.designation = 'Developer';
  emp2.salary = 25000;
  emp2.grade = 'A';
  print('\nName: ${emp2.name}');
  print('Age: ${emp2.age}');
  print('Designation: ${emp2.designation}');
  print('Salary: ${emp2.salary}');
  print('Grade: ${emp2.grade}');
  emp2.developSoftware();
  emp2.pushToGithub();
}
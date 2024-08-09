void main() {
  var emp = Employee();
  // Default setter
  emp.empName = 'Ayush';
  emp.empAge = 20;

  // Default getter
  print('Name: ${emp.empName}');
  print('Age: ${emp.empAge}');

  // Custom setter
  emp.salary = 25000;

  // Custom getter
  print('Salary: ${emp.sal}');
}


class Employee {
  var empName;
  var empAge;
  var empSalary;

  // Custom setter
  set salary(int salary) {
    empSalary = salary;
  }

  // Custom getter
  get sal {
    return empSalary;
  }
}
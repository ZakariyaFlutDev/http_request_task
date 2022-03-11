class Employee{
  int? employee_id;
  String? employee_name;
  int? employee_age;
  int? employee_salary;
  String? employee_image;

  Employee({required this.employee_id, required this.employee_name, required this.employee_age, required this.employee_salary, required this.employee_image});

  Employee.fromJson(Map<String, dynamic> json)
    : employee_id = json['employee_id'],
        employee_name = json['employee_name'],
        employee_age = json['employee_age'],
        employee_salary = json['employee_salary'],
        employee_image = json['employee_image'];

  Map<String,dynamic> toJson() => {
    'employee_id' : employee_id,
    'employee_name' : employee_name,
    'employee_age' : employee_age,
    'employee_salary' : employee_salary,
    'employee_image' : employee_image,
  };

}
class EmployeeModel {
  final String id;
  final String name;
  final int salary;
  final int age;
  final String? imageUrl;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.salary,
    required this.age,
    required this.imageUrl,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['employee_name'],
      salary: json['employee_salary'],
      age: json['employee_age'],
      imageUrl: json['profile_image'],
    );
  }
}

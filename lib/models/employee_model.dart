class EmployeeModel {
  final int id;
  final String firstName;
  final String midName;
  final String lastName;
  final int age;
  final String gender;
  final String imageUrl;

  EmployeeModel({
    required this.id,
    required this.firstName,
    required this.midName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.imageUrl,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      firstName: json['firstName'],
      midName: json['maidenName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      imageUrl: json['image'],
    );
  }
}

class EmployeeModel {
  final int id;
  final String firstName;
  final String midName;
  final String lastName;
  final int age;
  final String gender;
  final String birthDate;
  final String phone;
  final String email;
  final double height;
  final String imageUrl;
  final String university;

  EmployeeModel({
    required this.id,
    required this.firstName,
    required this.midName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.imageUrl,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.height,
    required this.university,
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
      email: json['email'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      height: json['height'],
      university: json['university'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'midName': midName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
      'imageUrl': imageUrl,
      'email': email,
      'phone': phone,
      'birthDate': birthDate,
      'height': height,
      'university': university,
    };
  }
}

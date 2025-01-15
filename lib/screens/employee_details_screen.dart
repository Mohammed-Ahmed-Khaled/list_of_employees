import 'package:flutter/material.dart';
import 'package:list_of_employees/models/employee_model.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  const EmployeeDetailsScreen({
    super.key,
    required this.employeeModel,
  });

  final EmployeeModel employeeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            employeeModel.imageUrl.isNotEmpty
                ? Image.network(
                    employeeModel.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/no_image.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                '${employeeModel.firstName} ${employeeModel.midName} ${employeeModel.lastName}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Age: ${employeeModel.age} years old',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Gender: ${employeeModel.gender}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Birth Date: ${employeeModel.birthDate}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Height: ${employeeModel.height}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Phone Number: ${employeeModel.phone}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${employeeModel.email}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'University: ${employeeModel.university}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

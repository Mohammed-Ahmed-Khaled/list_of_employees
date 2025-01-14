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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                employeeModel.imageUrl == null
                    ? 'assets/images/no_image.png'
                    : employeeModel.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              employeeModel.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age: ${employeeModel.age} | Salary: ${employeeModel.salary}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

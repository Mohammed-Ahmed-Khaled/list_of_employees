import 'package:flutter/material.dart';
import 'package:list_of_employees/models/employee_model.dart';
import 'package:list_of_employees/screens/employee_details_screen.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.employeeModel,
  });

  final EmployeeModel employeeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeDetailsScreen(
                employeeModel: employeeModel,
              ),
            ),
          );
        },
        child: Card(
          child: Column(
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
      ),
    );
  }
}

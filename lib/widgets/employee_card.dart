import 'package:flutter/material.dart';
import 'package:list_of_employees/models/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.employeeModel});

  final EmployeeModel employeeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          child: Column(
            children: [
              employeeModel.imageUrl.isNotEmpty
                  ? Expanded(
                      child: Image.network(
                        employeeModel.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Expanded(
                      child: Image.asset(
                        'assets/images/no_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    employeeModel.firstName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    employeeModel.midName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    employeeModel.lastName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'Age: ${employeeModel.age} | Gender: ${employeeModel.gender}',
                style: const TextStyle(
                  fontSize: 15,
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

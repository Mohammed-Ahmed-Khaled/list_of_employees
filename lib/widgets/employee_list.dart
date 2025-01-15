import 'package:flutter/material.dart';
import 'package:list_of_employees/models/employee_model.dart';
import 'package:list_of_employees/widgets/employee_card.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key, required this.employeeModels});

  final List<EmployeeModel> employeeModels;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: employeeModels.isNotEmpty
          ? ListView.builder(
              itemCount: employeeModels.length,
              itemBuilder: (context, index) {
                final employee = employeeModels[index];
                return EmployeeCard(employeeModel: employee);
              },
            )
          : Center(
              child: Text(
                'No Data found.',
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
            ),
    );
  }
}

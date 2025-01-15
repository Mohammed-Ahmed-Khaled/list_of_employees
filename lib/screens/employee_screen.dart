import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_of_employees/models/employee_model.dart';
import 'package:list_of_employees/widgets/employee_list.dart';
import 'package:list_of_employees/service/employee_service.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final EmployeeService employeeService = EmployeeService(Dio());
  List<EmployeeModel> employeesList = [];
  bool isLoading = false;

  Future<void> fetchEmployees() async {
    setState(() {
      isLoading = true;
    });
    try {
      List<EmployeeModel> employees = await employeeService.fetchEmployees();
      setState(() {
        employeesList = employees;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Error fetching employees. Please try again: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : EmployeeList(
              employeeModels: employeesList,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchEmployees,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

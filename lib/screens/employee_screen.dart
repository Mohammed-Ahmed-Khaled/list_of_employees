import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:list_of_employees/models/employee_model.dart';
import 'package:list_of_employees/service/employee_service.dart';
import 'package:list_of_employees/widgets/employee_list.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final EmployeeService employeeService = EmployeeService(Dio());
  List<EmployeeModel> employeesList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadCachedEmployees();
  }

  Future<void> loadCachedEmployees() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedData = prefs.getString('employees');

    if (cachedData != null) {
      List<dynamic> jsonData = json.decode(cachedData);
      List<EmployeeModel> cachedEmployees = jsonData
          .map((json) => EmployeeModel.fromJson(json as Map<String, dynamic>))
          .toList();
      setState(() {
        employeesList = cachedEmployees;
      });
    } else {
      fetchEmployees();
    }
  }

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
        SnackBar(content: Text('$e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> cacheEmployees(List<EmployeeModel> employees) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = json.encode(employees.map((e) => e.toJson()).toList());
    await prefs.setString('employees', jsonData);
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

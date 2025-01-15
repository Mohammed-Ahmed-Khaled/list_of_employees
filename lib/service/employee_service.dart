import 'package:dio/dio.dart';
import 'package:list_of_employees/models/employee_model.dart';

class EmployeeService {
  final Dio dio;
  EmployeeService(this.dio);

  Future<List<EmployeeModel>> fetchEmployees() async {
    try {
      Response response = await dio.get('https://dummyjson.com/users');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> employees = jsonData['users'];
        return employees
            .map((employee) => EmployeeModel.fromJson(employee))
            .toList();
      } else {
        throw Exception('Failed to fetch employees: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to fetch employees: $e');
    }
  }
}

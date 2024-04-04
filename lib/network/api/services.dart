// All Flutter Built-in Imports Here.

// All Custom Imports Here.
import 'package:dio/dio.dart';

// All Native Imports Here.
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/network/api/endpoints.dart';

// All Attributes or Constants Here.

// Use this method to get all the employees.

class ApiService {
  final Dio _dio = Dio();

  /// Api service to get all employees.
  Future<List<EmployeeModel>> getEmployees() async {
    try {
      final response = await _dio.get(
        AppEndpoints.employees,
      );

      final Map<String, dynamic> employeesData = response.data;
      final List<EmployeeModel> employees =
          (employeesData['data'] as List<dynamic>)
              .map<EmployeeModel>((employeeJson) =>
                  EmployeeModel.fromJson(employeeJson as Map<String, dynamic>))
              .toList();
      return employees;
    } catch (error) {
      rethrow;
    }
  }

  /// Api service to get a employee details.
  Future<EmployeeModel?> getEmployee({required String employeeId}) async {
    try {
      final response = await _dio.get(
        "${AppEndpoints.employee}/$employeeId",
      );

      if (response.data != null) {
        return EmployeeModel.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  /// Api service to create new employee.
  Future<bool?> createEmployee(EmployeeModel employee) async {
    try {
      final response = await _dio.post(
        AppEndpoints.createEmployee,
        data: employee.toJson(),
      );

      if (response.data['status'] == 'success') {
        return true;
      }
    } catch (error) {
      rethrow;
    }
    return false;
  }

  /// Api service to update employee details.
  Future<EmployeeModel?> updateEmployee(EmployeeModel employeeModel) async {
    try {
      final response = await _dio.put(
        "${AppEndpoints.updateEmployee}/${employeeModel.id}",
        data: employeeModel.toJson(),
      );

      if (response.data != null) {
        return EmployeeModel.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  /// Api service to delete a employee.
  Future<bool> deleteEmployee(String employeeId) async {
    try {
      final response = await _dio.delete(
        "${AppEndpoints.deleteEmployee}/$employeeId",
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      rethrow;
    }
    return false;
  }
}

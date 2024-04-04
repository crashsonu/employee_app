// All Flutter Built-in Imports Here.

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

import 'package:employee_app/models/employee.dart';

abstract class EmployeesState {}

class EmployeesInitial extends EmployeesState {}

class EmployeesLoading extends EmployeesState {}

class EmployeesLoaded extends EmployeesState {
  final List<EmployeeModel> employees;

  EmployeesLoaded(this.employees);
}

class EmployeesError extends EmployeesState {
  final String message;

  EmployeesError(this.message);
}

class SearchIconClickState extends EmployeesState{}

class EmployeeSearchedState extends EmployeesState {
  final List<EmployeeModel> employees;

  EmployeeSearchedState(this.employees);
}


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

///
class SearchIconClickState extends EmployeesState {}

class EmployeeSearchedState extends EmployeesState {
  final List<EmployeeModel> employees;

  EmployeeSearchedState(this.employees);
}

///
class EmployeeCreatingState extends EmployeesState {}

class EmployeeCreatedState extends EmployeesState {}

class EmployeeCreatingErrorState extends EmployeesState {
  String err;

  EmployeeCreatingErrorState(this.err);
}

///
class EmployeeUpdatingState extends EmployeesState {}

class EmployeeUpdatedState extends EmployeesState {}

class EmployeeUpdatingErrorState extends EmployeesState {
  final String err;

  EmployeeUpdatingErrorState(this.err);
}

///
class EmployeeDeletingState extends EmployeesState {}

class EmployeeDeletedState extends EmployeesState {}

class EmployeeDeletingErrorState extends EmployeesState {
  final String err;

  EmployeeDeletingErrorState(this.err);
}
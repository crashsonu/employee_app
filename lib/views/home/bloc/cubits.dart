// All Flutter Built-in Imports Here.

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

import 'package:employee_app/models/employee.dart';
import 'package:employee_app/network/api/services.dart';
import 'package:employee_app/views/home/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  EmployeesCubit() : super(EmployeesInitial());

  fetchEmployees() async {
    print('hiiiiiii');
    try {
      emit(EmployeesLoading());
      final employees = await ApiService().getEmployees();
      emit(EmployeesLoaded(employees));
    } catch (error) {
      emit(EmployeesError(error.toString()));
    }
  }
}

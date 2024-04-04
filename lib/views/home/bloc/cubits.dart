// All Flutter Built-in Imports Here.

// All Custom Imports Here.
import 'package:flutter_bloc/flutter_bloc.dart';

// All Native Imports Here.
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/network/api/services.dart';
import 'package:employee_app/views/home/bloc/states.dart';

// All Attributes or Constants Here.

class EmployeesCubit extends Cubit<EmployeesState> {
  List<EmployeeModel> allEmployees = [];
  bool isSearchClicked = false;
  bool isEmployeeSearched = false;

  EmployeesCubit() : super(EmployeesInitial());

  fetchEmployees() async {
    try {
      emit(EmployeesLoading());
      final employees = await ApiService().getEmployees();
      allEmployees = employees;
      emit(EmployeesLoaded(employees));
    } catch (error) {
      emit(EmployeesError(error.toString()));
    }
  }

  onSearchClick() {
    isSearchClicked = !isSearchClicked;
    emit(SearchIconClickState());
  }

  filterEmployeesByName(String name) {
    final lowercaseName = name.toLowerCase();
    List<EmployeeModel> filteredEmp = allEmployees.where((employee) {
      final lowercaseEmployeeName = employee.employeeName.toLowerCase();
      return lowercaseEmployeeName.contains(lowercaseName);
    }).toList();
    isEmployeeSearched = !isEmployeeSearched;
    emit(EmployeeSearchedState(filteredEmp));
  }

  createEmployee(EmployeeModel employee) async {
    emit(EmployeeCreatingState());
    try {
      final response = await ApiService().createEmployee(employee);

      if (response == true) {
        emit(EmployeeCreatedState());
      } else {
        emit(EmployeeCreatingErrorState('Failed to create employee'));
      }
    } catch (er) {
      emit(EmployeeCreatingErrorState(
          "Failed to create employee can't post to api try again till submit"));
    }
  }
}

// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:flutter_bloc/flutter_bloc.dart';

// All Native Imports Here.
import 'package:employee_app/constants/texts.dart';
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/views/home/bloc/cubits.dart';
import 'package:employee_app/views/home/bloc/states.dart';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';

// All Attributes or Constants Here.

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Employees',
          color: Colors.white,
          textSize: 17,
        ),
      ),
      body: BlocProvider(
          create: (context) => EmployeesCubit(),
          child: const HomeViewBodyWidget()),
    );
  }
}

class HomeViewBodyWidget extends StatefulWidget {
  const HomeViewBodyWidget({super.key});

  @override
  State<HomeViewBodyWidget> createState() => _HomeViewBodyWidgetState();
}

class _HomeViewBodyWidgetState extends State<HomeViewBodyWidget> {
  @override
  void initState() {
    super.initState();
    initAsync();
  }

  Future<void> initAsync() async {
    await BlocProvider.of<EmployeesCubit>(context).fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesCubit, EmployeesState>(
        builder: (context, state) {
      if (state is EmployeesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is EmployeesLoaded) {
        return buildEmployeesList(state.employees);
      } else if (state is EmployeesError) {
        return const Center(
          child: Text(
              'Error: Too many requests error occured by api call please refresh}'),
        );
      }
      return const SizedBox();
    });
  }

  Widget buildEmployeesList(List<EmployeeModel> employees) {
    employees.sort((a, b) => a.employeeName.compareTo(b.employeeName));
    return AlphabetScrollView(
      list: employees.map((e) => AlphaModel(e.employeeName)).toList(),
      alignment: LetterAlignment.right,
      itemExtent: 50,
      itemBuilder: (context, index, str) {
        final employee = employees[index];
        return ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(employee.employeeName),
        );
      },
      selectedTextStyle: const TextStyle(
          fontSize: 19, fontWeight: FontWeight.bold, color: Colors.red),
      unselectedTextStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
    );
  }
}

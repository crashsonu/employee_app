// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:flutter_bloc/flutter_bloc.dart';

// All Native Imports Here.
import 'package:employee_app/utils/helpers.dart';
import 'package:employee_app/constants/texts.dart';
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/constants/colors.dart';
import 'package:employee_app/views/blocs/employee/states.dart';
import 'package:employee_app/views/blocs/employee/cubits.dart';

// All Attributes or Constants Here.

class DesktopCreateEmployeeView extends StatefulWidget {
  const DesktopCreateEmployeeView({super.key});

  @override
  State<DesktopCreateEmployeeView> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<DesktopCreateEmployeeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const AppText(
          text: 'Create Employee',
          color: Colors.white,
          textSize: 17,
        ),
      ),
      body: BlocConsumer<EmployeesCubit, EmployeesState>(
        listener: (context, state) {
          if (state is EmployeeCreatingErrorState) {
            showScaffoldMessage(context, state.err, color: Colors.redAccent);
          } else if (state is EmployeeCreatedState) {
            showScaffoldMessage(context, 'Employee created',
                color: Colors.green);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is EmployeeCreatingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Full name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _salaryController,
                    decoration: const InputDecoration(labelText: 'Salary'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a salary';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(labelText: 'Age'),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.parse(value) < 10 ||
                          int.parse(value) > 100) {
                        return 'Please enter valid an age';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        EmployeeModel employee = EmployeeModel(
                            id: _nameController.text,
                            employeeName: _nameController.text,
                            employeeSalary: _salaryController.text.toString(),
                            employeeAge: _ageController.text.toString(),
                            profileImage: 'url');
                        await BlocProvider.of<EmployeesCubit>(context)
                            .createEmployee(employee);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor),
                    child: const AppText(
                        text: 'Create Employee', color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/constants/colors.dart';
import 'package:employee_app/constants/texts.dart';
import 'package:employee_app/models/employee.dart';

// All Attributes or Constants Here.

class EmployeeDetailsView extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailsView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppText(
          text: 'Employee Details',
          color: Colors.white,
          textSize: 17,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.person_rounded,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppText(
              text: 'Name: ${employee.employeeName}',
              textSize: 17,
              bold: true,
            ),
            const SizedBox(height: 8.0),
            AppText(
              text: 'ID: ${employee.id}',
              textSize: 15,
              bold: true,
            ),
            const SizedBox(height: 8.0),
            AppText(
              text: 'Salary: ${employee.employeeSalary}',
            ),
            const SizedBox(height: 8.0),
            AppText(
              text: 'Age: ${employee.employeeAge}',
            ),
            const SizedBox(height: 8.0),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

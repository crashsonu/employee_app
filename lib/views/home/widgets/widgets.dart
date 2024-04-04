// All Flutter Built-in Imports Here.
import 'package:employee_app/constants/colors.dart';
import 'package:employee_app/constants/texts.dart';
import 'package:employee_app/models/employee.dart';
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

class EmployeeItem extends StatefulWidget {
  final EmployeeModel employee;

  const EmployeeItem({super.key, required this.employee});

  @override
  State<EmployeeItem> createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  bool _showIcons = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _showIcons = true;
        });
      },
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: AppText(text: widget.employee.employeeName),
          ),
          if (_showIcons) ...[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Handle edit action
                print('Edit pressed');
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Handle delete action
                print('Delete pressed');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.redAccent,
              ),
              onPressed: () {
                setState(() {
                  _showIcons = false;
                });
              },
            ),
          ],
        ],
      ),
    );
  }
}

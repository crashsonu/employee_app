// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// All Native Imports Here.
import 'package:employee_app/constants/colors.dart';
import 'package:employee_app/constants/texts.dart';
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/network/router/names.dart';
import 'package:employee_app/views/home/bloc/cubits.dart';

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
    EmployeesCubit employeesCubit = BlocProvider.of<EmployeesCubit>(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRoute.empDetails,
            extra: {'employee': widget.employee});
      },
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
                GoRouter.of(context).pushNamed(AppRoute.updateEmployee,
                    extra: {'employee': widget.employee});
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async{
                await employeesCubit.deleteEmployee(widget.employee.id);
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

// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';

// All Native Imports Here.
import 'package:employee_app/utils/helpers.dart';
import 'package:employee_app/constants/texts.dart';
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/constants/colors.dart';
import 'package:employee_app/network/router/names.dart';
import 'package:employee_app/views/home/widgets/widgets.dart';
import 'package:employee_app/views/home/blocs/employee/cubits.dart';
import 'package:employee_app/views/home/blocs/employee/states.dart';

// All Attributes or Constants Here.

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeesCubit employeesCubit = BlocProvider.of<EmployeesCubit>(context);

    return BlocBuilder<EmployeesCubit, EmployeesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: const AppText(
                text: 'Employees',
                color: Colors.white,
                textSize: 17,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      if (employeesCubit.isSearchClicked) {
                        employeesCubit.onSearchClick();
                        return;
                      }
                      BlocProvider.of<EmployeesCubit>(context).onSearchClick();
                    },
                    icon: Icon(
                        employeesCubit.isSearchClicked
                            ? Icons.search_off
                            : Icons.search,
                        color: Colors.white))
              ]),
          body: const HomeViewBodyWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FilledButton(
            onPressed: () {
              employeesCubit.isSearchClicked = false;
              GoRouter.of(context).pushNamed(AppRoute.createEmployee);
            },
            style:
                FilledButton.styleFrom(backgroundColor: AppColors.primaryColor),
            child: const AppText(text: 'Create Employee', color: Colors.white),
          ),
        );
      },
    );
  }
}

class HomeViewBodyWidget extends StatefulWidget {
  const HomeViewBodyWidget({super.key});

  @override
  State<HomeViewBodyWidget> createState() => _HomeViewBodyWidgetState();
}

class _HomeViewBodyWidgetState extends State<HomeViewBodyWidget> {
  TextEditingController searchController = TextEditingController();
  GlobalKey searchFormKey = GlobalKey<FormState>();

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
    final width = MediaQuery.of(context).size.width;
    EmployeesCubit employeesCubit = BlocProvider.of<EmployeesCubit>(context);
    return BlocConsumer<EmployeesCubit, EmployeesState>(
        listener: (context, state) {
      if (state is EmployeeDeletingErrorState) {
        showScaffoldMessage(context, state.err, color: Colors.redAccent);
      } else if (state is EmployeeDeletedState) {
        showScaffoldMessage(context, 'Employee deleted', color: Colors.green);
      }
    }, builder: (context, state) {
      if (state is EmployeesLoading || state is EmployeeDeletingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is EmployeesError) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Error: Too many requests error occured by api call, please rebuild till u see the employee list. '),
          ),
        );
      }
      return Column(
        children: [
          if (employeesCubit.isSearchClicked == true)
            SizedBox(
              width: width * 0.8,
              child: TextFormField(
                controller: searchController,
                readOnly: employeesCubit.isEmployeeSearched,
                decoration: InputDecoration(
                    hintText: 'Search name here...',
                    suffix: employeesCubit.isEmployeeSearched
                        ? IconButton(
                            onPressed: () {
                              employeesCubit.onSearchClick();
                              searchController.clear();
                              employeesCubit.isEmployeeSearched = false;
                            },
                            icon: const Icon(Icons.close))
                        : FilledButton(
                            onPressed: () {
                              employeesCubit
                                  .filterEmployeesByName(searchController.text);
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: AppColors.primaryColor),
                            child: const AppText(
                                text: 'Search', color: Colors.white),
                          )),
              ),
            ),
          if (state is EmployeesLoaded)
            Expanded(child: buildEmployeesList(state.employees)),
          if (state is SearchIconClickState ||
              state is EmployeeCreatedState ||
              state is EmployeeDeletedState ||
              state is EmployeeDeletingErrorState)
            Expanded(child: buildEmployeesList(employeesCubit.allEmployees)),
          if (state is EmployeeSearchedState)
            Expanded(child: buildEmployeesList(state.employees)),
        ],
      );
    });
  }

  Widget buildEmployeesList(List<EmployeeModel> employees) {
    employees.sort((a, b) => a.employeeName.compareTo(b.employeeName));
    return AlphabetScrollView(
      list: employees.map((e) => AlphaModel(e.employeeName)).toList(),
      alignment: LetterAlignment.right,
      itemExtent: 70,
      itemBuilder: (context, index, str) {
        final employee = employees[index];
        return EmployeeItem(employee: employee);
      },
      selectedTextStyle: const TextStyle(
          fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
      unselectedTextStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
    );
  }
}

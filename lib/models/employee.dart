// All Flutter Built-in Imports Here.

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

class EmployeeModel {
  String id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  EmployeeModel({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] as String,
      employeeName: json['employee_name'] as String,
      employeeSalary: int.parse(json['employee_salary']),
      employeeAge: int.parse(json['employee_age']),
      profileImage: json['profile_image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employee_name'] = employeeName;
    data['employee_salary'] = employeeSalary.toString();
    data['employee_age'] = employeeAge.toString();
    data['profile_image'] = profileImage;
    return data;
  }
}

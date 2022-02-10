import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/stores/employee/employee_store.dart';
import 'package:employee_management/ui/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'edit_employee_viewmodel.g.dart';

class EditEmployeeViewModel = _EditEmployeeViewModel
    with _$EditEmployeeViewModel;

abstract class _EditEmployeeViewModel with Store {
  final store = EmployeeStore();
  final formKey = GlobalKey<FormState>();
  final nameKey = GlobalKey<FormFieldState>();
  final yearKey = GlobalKey<FormFieldState>();
  final salaryKey = GlobalKey<FormFieldState>();

  get name => nameKey.currentState?.value as String?;

  get year => int.tryParse(yearKey.currentState?.value);

  get salary => double.tryParse(salaryKey.currentState?.value);

  late final Employee employee;

  void setEmployee(Employee employee) => this.employee = employee;

  @action
  String? nameValidator(String? value) =>
      (value?.isEmpty ?? false) ? "Invalid" : null;

  @action
  String? yearValidator(String? value) =>
      (value?.isEmpty ?? false) ? "Invalid" : null;

  @action
  String? salaryValidator(String? value) =>
      (value?.isEmpty ?? false) ? "Invalid" : null;

  bool get isFormValid => formKey.currentState?.validate() ?? false;

  @action
  Future updateEmployee() async {
    if (isFormValid) {
      await store.update(Employee(
          id: employee.id, name: name, yearBorn: year, salary: salary));
      await pop();
    }
  }

  @action
  Future deleteEmployee() async {
    await store.delete(Employee(
        id: employee.id, name: name, yearBorn: year, salary: salary));
    await pop();
  }

  @action
  Future pop() async {
    Get.find<HomeViewModel>().getAllEmployee();
    Get.back();
  }
}

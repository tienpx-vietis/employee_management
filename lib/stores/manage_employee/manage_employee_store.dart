import 'package:employee_management/core/injector.dart';
import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/data/service/employee_service.dart';
import 'package:employee_management/stores/employee/employee_store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'manage_employee_store.g.dart';

class ManageEmployeeStore = _ManageEmployeeStore with _$ManageEmployeeStore;

abstract class _ManageEmployeeStore with Store {
  final employeeService = Get.find<EmployeeService>();
  final employeeStore = EmployeeStore();

  @action
  Future<bool> add() async {
    if (!employeeStore.isValid) {
      return false;
    }
    final _employee = Employee(
        name: employeeStore.name,
        yearBorn: employeeStore.yearBorn,
        salary: employeeStore.salary);
    await employeeService.insert(_employee);
    return true;
  }

  @action
  Future<bool> update() async {
    if (!employeeStore.isValid) {
      return false;
    }
    final _employee = Employee(
        id: employeeStore.id,
        name: employeeStore.name,
        yearBorn: employeeStore.yearBorn,
        salary: employeeStore.salary);
    await employeeService.update(_employee);
    return true;
  }

  @action
  Future<bool> delete() async {
    if (employeeStore.id == null) {
      return false;
    }
    await employeeService.delete(employeeStore.id!);
    return true;
  }
}

import 'package:employee_management/core/injector.dart';
import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/stores/manage_employee/manage_employee_store.dart';
import 'package:employee_management/ui/home/home_viewmodel.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'upsert_employee_viewmodel.g.dart';

class UpsertEmployeeViewModel = _UpsertEmployeeViewModel with _$UpsertEmployeeViewModel;

abstract class _UpsertEmployeeViewModel with Store {
  final manageStore = ManageEmployeeStore();

  @action
  Future addEmployee() async {
    if(await manageStore.add()) {
     await reloadListEmployee();
    }
  }

  @action
  Future updateEmployee() async {
    if(await manageStore.update()) {
      await reloadListEmployee();
    }
  }

  @action
  Future deleteEmployee() async {
    if(await manageStore.delete()) {
      await reloadListEmployee();
    }
  }

  @action
  Future reloadListEmployee() async {
    await Get.find<HomeViewModel>().employeesStore.getListEmployees();
    Get.back();
  }
}

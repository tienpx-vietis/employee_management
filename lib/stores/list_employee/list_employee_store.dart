import 'package:employee_management/core/injector.dart';
import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/data/service/employee_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'list_employee_store.g.dart';

class ListEmployeeStore = _ListEmployeeStore with _$ListEmployeeStore;

abstract class _ListEmployeeStore with Store {
  final _service = Get.find<EmployeeService>();

  static ObservableFuture<List<Employee>?> emptyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<List<Employee>?> fetchListEmployeesFuture =
      ObservableFuture<List<Employee>?>(emptyResponse);

  @observable
  List<Employee>? employees;

  @observable
  bool success = false;

  @computed
  bool get isLoading => fetchListEmployeesFuture.status == FutureStatus.pending;

  @action
  Future getListEmployees() async {
    final future = _service.getAllEmployee();
    fetchListEmployeesFuture = ObservableFuture(future);

    future.then((result) {
      employees = result;
    });
  }
}

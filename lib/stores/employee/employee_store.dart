import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/data/service/employee_repository.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  final _repository = Get.find<EmployeeRepository>();

  @observable
  List<Employee> employees = [];

  @observable
  bool isLoading = false;

  @action
  Future getAll() async {
    isLoading = true;
    _repository.getAllEmployee().then((result) {
      employees = result;
      isLoading = false;
    }).catchError((_) {
      isLoading = false;
    });
  }

  @action
  Future add(Employee employee) async {
    return _repository.insert(employee);
  }

  @action
  Future update(Employee employee) async {
    return _repository.update(employee);
  }

  @action
  Future<bool> delete(Employee employee) async {
    if(employee.id == null) {
      return false;
    }
    await _repository.delete(employee.id!);
    return true;
  }
}

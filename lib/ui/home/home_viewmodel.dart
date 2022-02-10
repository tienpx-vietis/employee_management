import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/stores/employee/employee_store.dart';
import 'package:employee_management/ui/add_employee/add_employee_view.dart';
import 'package:employee_management/ui/add_employee/add_employee_viewmodel.dart';
import 'package:employee_management/ui/edit_employee/edit_employee_view.dart';
import 'package:employee_management/ui/edit_employee/edit_employee_viewmodel.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final _employeesStore = EmployeeStore();

  @computed
  bool get isLoading => _employeesStore.isLoading;

  @computed
  List<Employee> get employees => _employeesStore.employees;

  @computed
  double get totalSalary => employees
      .map((e) => e.salary)
      .fold(0, (previous, current) => previous + (current ?? 0));

  @computed
  String get oldestEmployeeName {
    final list = employees;
    if (list.isEmpty) {
      return "";
    }
    final employee = list.reduce((current, next) =>
        getAgeFromYearBorn(current.yearBorn) > getAgeFromYearBorn(next.yearBorn)
            ? current
            : next);
    return employee.name ?? "";
  }

  @action
  void getAllEmployee() {
    _employeesStore.getAll();
  }

  @action
  int getAgeFromYearBorn(int? year) {
    int age = DateTime.now().year - (year ?? 0);
    return age;
  }

  @action
  void toAddEmployee() {
    Get.to(
      () => const AddEmployeeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AddEmployeeViewModel>(() => AddEmployeeViewModel());
      }),
    );
  }

  @action
  void toEditEmployee(Employee employee) {
    Get.to(
      () => EditEmployeeView(employee: employee),
      binding: BindingsBuilder(() {
        Get.lazyPut<EditEmployeeViewModel>(() => EditEmployeeViewModel());
      }),
    );
  }
}

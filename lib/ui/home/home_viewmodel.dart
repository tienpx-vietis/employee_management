import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/stores/list_employee/list_employee_store.dart';
import 'package:employee_management/ui/upsert_employee/upsert_employee_page.dart';
import 'package:employee_management/ui/upsert_employee/upsert_employee_viewmodel.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final employeesStore = ListEmployeeStore();

  @computed
  double get totalSalary => (employeesStore.employees ?? [])
      .map((e) => e.salary)
      .fold(0, (previous, current) => previous + (current ?? 0));

  @computed
  String get oldestEmployeeName {
    final list = (employeesStore.employees ?? []);
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
  int getAgeFromYearBorn(int? year) {
    int age = DateTime.now().year - (year ?? 0);
    return age;
  }

  @action
  void toUpsertEmployee(Employee? employee) {
    Get.to(
      () => UpsertEmployeePage(employee: employee),
      binding: BindingsBuilder(() {
        Get.lazyPut<UpsertEmployeeViewModel>(() => UpsertEmployeeViewModel());
      }),
    );
  }
}

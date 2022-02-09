import 'package:employee_management/data/db/local_database.dart';
import 'package:employee_management/data/service/employee_service.dart';
import 'package:employee_management/ui/home/home_viewmodel.dart';
import 'package:employee_management/ui/upsert_employee/upsert_employee_viewmodel.dart';
import 'package:get/get.dart';

class Injector {
  static Future<void> setup() async {
    Get.lazyPut<LocalDatabase>(() => LocalDatabase());
    Get.lazyPut<EmployeeService>(() => EmployeeService());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}
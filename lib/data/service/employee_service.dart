import 'package:employee_management/core/injector.dart';
import 'package:employee_management/data/db/local_database.dart';
import 'package:employee_management/data/model/employee.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';

class EmployeeService {
  final _store = intMapStoreFactory.store('employee');

  Future<Database> get _db async => await Get.find<LocalDatabase>().database;

  Future<Employee> insert(Employee employee) async {
    final id = await _store.add(await _db, employee.toJson());
    return employee.copyWith(id: id);
  }

  Future<List<Employee>> getAllEmployee() async {
    final recordSnapshots = await _store.find(
      await _db,
    );
    return recordSnapshots.map((snapshot) {
      return Employee.fromJson(snapshot.value).copyWith(id: snapshot.key);
    }).toList();
  }

  Future<Employee> update(Employee employee) async {
    final finder = Finder(filter: Filter.byKey(employee.id));
    final id = await _store.update(
      await _db,
      employee.toJson(),
      finder: finder,
    );
    return employee.copyWith(id: id);
  }

  Future<int> delete(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    return await _store.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _store.drop(
      await _db,
    );
  }
}
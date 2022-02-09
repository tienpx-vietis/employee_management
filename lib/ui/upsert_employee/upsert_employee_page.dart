import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/stores/employee/employee_store.dart';
import 'package:employee_management/ui/upsert_employee/upsert_employee_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class UpsertEmployeePage extends StatefulWidget {
  const UpsertEmployeePage({Key? key, this.employee}) : super(key: key);

  final Employee? employee;

  @override
  _UpsertEmployeePageState createState() => _UpsertEmployeePageState();
}

class _UpsertEmployeePageState extends State<UpsertEmployeePage> {
  final vm = Get.find<UpsertEmployeeViewModel>();
  late EmployeeStore employeeStore;
  late bool isAddMode;

  @override
  void initState() {
    super.initState();
    isAddMode = widget.employee == null;
    employeeStore = vm.manageStore.employeeStore;
    if (isAddMode) {
      employeeStore.setupValidations();
    } else {
      employeeStore.setupValidations();
      employeeStore.set(widget.employee!);
    }
  }

  @override
  void dispose() {
    employeeStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: isAddMode
              ? const Text('Add Management')
              : const Text('Edit Management'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (context) {
                return TextFormField(
                  initialValue: employeeStore.name,
                  onChanged: (value) => employeeStore.setName(value),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(
                      Icons.person,
                    ),
                    errorText: employeeStore.nameValidation.message,
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (context) {
                return TextFormField(
                  initialValue: employeeStore.yearBorn?.toString(),
                  onChanged: (value) => employeeStore.setYearBorn(value),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Year Born',
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(
                      Icons.date_range,
                    ),
                    errorText: employeeStore.yearBornValidation.message,
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (context) {
                return TextFormField(
                  initialValue: employeeStore.salary?.toString(),
                  onChanged: (value) => employeeStore.setSalary(value),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Salary',
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(
                      Icons.attach_money,
                    ),
                    errorText: employeeStore.salaryValidation.message,
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (context) {
                final isEnabled = employeeStore.isValid;
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (isEnabled) {
                        if (isAddMode) {
                          vm.addEmployee();
                        } else {
                          vm.updateEmployee();
                        }
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            isEnabled ? Colors.blue : Colors.grey)),
                    icon: isAddMode
                        ? const Icon(Icons.add)
                        : const Icon(Icons.edit),
                    label: isAddMode ? const Text("ADD") : const Text("Edit"),
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: !isAddMode,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      vm.deleteEmployee();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    icon: const Icon(Icons.delete_forever),
                    label: const Text("DELETE FOREVER"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

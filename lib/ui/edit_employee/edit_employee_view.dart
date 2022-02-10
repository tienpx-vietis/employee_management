import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/ui/edit_employee/edit_employee_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class EditEmployeeView extends StatefulWidget {
  const EditEmployeeView({Key? key, required this.employee}) : super(key: key);
  final Employee employee;

  @override
  _EditEmployeeViewState createState() => _EditEmployeeViewState();
}

class _EditEmployeeViewState extends State<EditEmployeeView> {
  final vm = Get.find<EditEmployeeViewModel>();

  @override
  void initState() {
    super.initState();
    vm.setEmployee(widget.employee);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employee = widget.employee;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Edit Management'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: vm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Observer(builder: (context) {
                  return TextFormField(
                    initialValue: employee.name,
                    key: vm.nameKey,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.person,
                      ),
                    ),
                    validator: vm.nameValidator,
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Observer(builder: (context) {
                  return TextFormField(
                    initialValue: employee.yearBorn.toString(),
                    key: vm.yearKey,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Year Born',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.date_range,
                      ),
                    ),
                    validator: vm.yearValidator,
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Observer(builder: (context) {
                  return TextFormField(
                    initialValue: employee.salary.toString(),
                    key: vm.salaryKey,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Salary',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.attach_money,
                      ),
                    ),
                    validator: vm.salaryValidator,
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      vm.updateEmployee();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                    icon: const Icon(Icons.add),
                    label: const Text("EDIT"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
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
              ],
            ),
          ),
        ));
  }
}

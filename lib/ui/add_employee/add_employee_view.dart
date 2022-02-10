import 'package:employee_management/data/model/employee.dart';
import 'package:employee_management/ui/add_employee/add_employee_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class AddEmployeeView extends StatefulWidget {
  const AddEmployeeView({Key? key, this.employee}) : super(key: key);
  final Employee? employee;

  @override
  _AddEmployeeViewState createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  final vm = Get.find<AddEmployeeViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Add Management'),
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
                      vm.addEmployee();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                    icon: const Icon(Icons.add),
                    label: const Text("ADD"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}

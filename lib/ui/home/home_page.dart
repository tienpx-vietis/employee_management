import 'package:employee_management/ui/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final vm = Get.find<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    vm.employeesStore.getListEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Employee Management'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  vm.toUpsertEmployee(null);
                }),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Observer(
              builder: (context) {
                return Row(
                  children: [
                    CardTitleWidget(
                      title: "Total Salary:",
                      secondaryText: "${vm.totalSalary} \$",
                    ),
                    CardTitleWidget(
                      title: "Oldest Employee:",
                      secondaryText: vm.oldestEmployeeName,
                    ),
                  ],
                );
              }
            ),
            Expanded(
              child: Card(
                child: Observer(builder: (context) {
                  final store = vm.employeesStore;
                  if (store.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (store.employees == null) {
                    return Container();
                  }
                  final employees = store.employees!;
                  return ListView.separated(
                    itemCount: employees.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final employee = employees[index];
                      return ListTile(
                        title: Text(employee.name ?? ""),
                        subtitle: Text(
                            'Age: ${vm.getAgeFromYearBorn(employee.yearBorn)}'
                            '\nSalary: ${employee.salary} \$'),
                        leading: const Icon(Icons.person),
                        trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            iconSize: 20,
                            onPressed: () {
                              vm.toUpsertEmployee(employee);
                            }),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ));
  }
}

class CardTitleWidget extends StatelessWidget {
  const CardTitleWidget(
      {Key? key, required this.title, required this.secondaryText})
      : super(key: key);

  final String title;
  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(secondaryText)
          ]),
        ),
      ),
    );
  }
}

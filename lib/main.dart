import 'package:employee_management/core/injector.dart';
import 'package:employee_management/ui/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

Future<void> main() async {
  await Injector.setup();
  // mainContext.config = mainContext.config.clone(
  //   isSpyEnabled: true,
  // );
  // mainContext.spy(print);
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6200EE),
      ),
      getPages: [GetPage(name: "/", page: () => const HomeView())],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/controller/home_controller.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/utils/my_binding.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/view/homeview.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // Initialize when it is needed , called once , once it's clear, cannot be initialized again
  final controller = Get.lazyPut(() =>
      HomeController() /* ,
      fenix: true  */ /* Clear everything inside the controller (reset) */);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  Get.to(() => const HomeView(),
                      binding: MyBinding() /*  Third method */);
                },
                child: const Text(' To Home View'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

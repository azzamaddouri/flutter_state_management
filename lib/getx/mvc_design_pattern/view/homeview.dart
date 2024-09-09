import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Always initialize the controller
  //final HomeController controller = Get.put(HomeController(), permanent: true /* Keep the value after quiting the navigation */);
  // Inside a child page is called multiple time cause if I navigate back then navigate again, it will forget it then initialized again
  final c = Get.lazyPut(() => HomeController());
  // find the right instance of the controller
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter value:',
              style: TextStyle(fontSize: 24),
            ),
            // Similar to the consumer
            /* GetBuilder */ /* GetX<HomeController> */ Obx(
              () =>
                  //init: HomeController(),
                  //builder: (controller) =>
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      controller.decrementCounter();
                    },
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '${controller.counter.value}',
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.incrementCounter();
                    },
                    child: const Text('+'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Dialog + Snackbar + BottomSheet
                      //Get.defaultDialog();
                      if (Get.isDarkMode) {
                        Get.changeTheme(Themes.customDarkTheme);
                      } else {
                        Get.changeTheme(ThemeData.dark());
                      }
                    },
                    child: const Text('Change Theme'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// State Management
// GetBuilder --> based on update to rebuild ( not reactive ) // Similar to the funtionality of consumer
// Getx  --> based on stream (memory + slow) ( reactive ) // Similar to Selector
// Obs --> based on stream (memory + slow) ( reactive )

// DI
// Design Pattern allows objects to be passed as arguments to other objects

// Bindings

class Themes {
  static ThemeData customDarkTheme = ThemeData.dark()
      .copyWith(appBarTheme: AppBarTheme(color: Colors.amberAccent));
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  // equal to  Navigator.push(context,MaterialPageRoute(builder: (context) => const PageOne()));
                  //Get.to(PageOne());

                  // equal to  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const PageOne()));
                  // Get.off(PageOne());

                  // named route
                  Get.toNamed("/pageone");
                },
                child: const Text('To Page One'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

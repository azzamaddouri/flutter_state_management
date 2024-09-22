import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/route_management/pageone.dart';
import 'package:get/get.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Two"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  //Get.to(PageOne());

                  // equal to --> Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const PageOne()),(Route<dynamic> route) => false,);
                  Get.offAll(const PageOne());
                },
                child: const Text(' To page One'),
              ),
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  // equal to --> Navigator.of(context).maybePop();
                  Get.back();
                },
                child: const Text('Back'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

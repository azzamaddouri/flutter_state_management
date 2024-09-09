import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/route_management/pagetwo.dart';
import 'package:get/get.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  // Removes page one and replace it with Page Two
                  //Get.off(PageTwo());
                  Get.to(PageTwo());
                },
                child: const Text(' To Page Two'),
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

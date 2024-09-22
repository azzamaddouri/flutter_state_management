import 'package:get/get.dart';

// Gets refreshed whenever you visit a new page, and when you leave that page, the controller gets disposed
class HomeController extends GetxController {
  // Using GetBuilder
/*   int counter = 0;

  void incrementCounter() {
    counter++;
    // like notifyListeners
    update();
  }

  void decrementCounter() {
    counter--;
    update();
  } */
  // Using GetX which is reactive listeners to the changes directly : Streams
  RxInt counter = 0.obs;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  // Controller's Lifecycle
  // InitState() before build
  @override
  void onInit() {
    print("Init Controller");
    super.onInit();
  }

  // After build
  @override
  void onReady() {
    print("Ready Controller");
    super.onReady();
  }

  @override
  void onClose() {
    print("Close Controller");
    super.onClose();
  }
}

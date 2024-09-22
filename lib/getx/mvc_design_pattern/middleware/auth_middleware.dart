import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Intercept and modify routing behavior before the user navigates to a new route
class AuthMiddleware extends GetMiddleware {
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (true /* user.role == 'admin' */)
      return const RouteSettings(name: '/homeview');
  }
}

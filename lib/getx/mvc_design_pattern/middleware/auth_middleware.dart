import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  int? get priority => 1;
  
  @override
  RouteSettings? redirect(String? route) {
    if (true) return const RouteSettings(name: '/homeview');
  }
}

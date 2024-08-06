import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api/utils/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_route,
    ),
  );
}

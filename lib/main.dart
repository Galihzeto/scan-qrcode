import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scan_qrcode/feature/login/login_page.dart';
import 'package:scan_qrcode/util/locator.dart';

void main() {
  runApp(MyApp());
  setupLocator();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

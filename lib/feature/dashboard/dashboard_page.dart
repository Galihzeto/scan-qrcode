import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
          leading: Container(),
        ),
        body: body(),
      ),
    );
  }

  Widget body() {
    return Container(
      child: Center(
        child: Text("CIEEEE BISA MASUK"),
      ),
    );
  }
}

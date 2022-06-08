import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("跳转到404页面");
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Center(
        child: Text(
          "404",
          style: TextStyle(
              color: Colors.red, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

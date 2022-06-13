import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  String? msg;

  Page2({this.msg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //如果msg为空，则尝试从setting里取值
    msg ??= ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGE 2"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("PAGE 2",
                style: TextStyle(color: Color(0xaaccdd), fontSize: 32)),
            Text("接收到的数据：$msg")
          ],
        ),
      ),
    );
  }
}

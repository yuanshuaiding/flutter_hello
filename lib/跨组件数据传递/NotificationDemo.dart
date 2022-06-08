import 'package:flutter/material.dart';

///1. 自定义Notification，用于监听子widget发送的通知事件
class CustomNotification extends Notification {
  CustomNotification(this.msg);

  String msg = "";
}

class MyChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => CustomNotification("hi!").dispatch(context),
      child: Text("发送Hi"),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.yellow[800];
          }
          return Colors.blue;
        }),
      ),
    );
  }
}

class MyNotificationWidget extends StatefulWidget {
  @override
  State createState() => _MyParentState();
}

class _MyParentState extends State<MyNotificationWidget> {
  String sayHi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification Demo"),
        ),
        body: NotificationListener<CustomNotification>(
            onNotification: (notification) {
              setState(() {
                sayHi += notification.msg;
              });
              return true;
            },
            child: Center(
              child: Column(
                children: [Text(sayHi), MyChildWidget()],
              ),
            )));
  }
}

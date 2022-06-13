import 'package:flutter/material.dart';
import 'package:hello_flutter/%E8%B7%A8%E9%A1%B5%E9%9D%A2%E6%95%B0%E6%8D%AE%E4%BC%A0%E9%80%92/Page2.dart';

import '../routes.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGE 1"),
      ),
      body: Page1View(),
    );
  }
}

class Page1View extends StatefulWidget {
  @override
  State createState() => _Page1State();
}

class _Page1State extends State<Page1View> {
  late TextEditingController _text;

  @override
  void initState() {
    super.initState();
    _text = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                controller: _text),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ARGUMENTS_DEMO, arguments: {"input", _text.text});
            },
            child: Text("命名路由传参"),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.yellow;
                  }
                  return Colors.blue;
                })),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Page2(msg: _text.text),
              ));
            },
            child: Text("构建路由传参"),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.yellow;
                  }
                  return Colors.blue;
                })),
          ),
        ],
      ),
    );
  }
}

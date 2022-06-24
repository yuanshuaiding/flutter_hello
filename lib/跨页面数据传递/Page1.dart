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
  late TextEditingController _textController;
  var result = "";

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
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
                controller: _textController),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ARGUMENTS_DEMO, arguments: {"input", _textController.text});
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
                builder: (context) => Page2(msg: _textController.text),
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
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => Page2(msg: _textController.text),
                  ))
                  .then((value) => setState(() {
                        result = value;
                      }));
            },
            child: Text("带返回参数跳转1"),
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
            onPressed: () async {
              var msg = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                print("启动page2");
                return Page2(msg: _textController.text);
              }));
              print("接收page2返回值：$msg");
              setState(() {
                result = msg;
              });
            },
            child: Text("带返回参数跳转2"),
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
          if (result.isNotEmpty)
            Text(
              result,
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

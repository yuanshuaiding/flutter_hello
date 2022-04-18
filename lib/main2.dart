import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_flutter/parallaxListDemo.dart';

import 'listViewDemo.dart';
import 'routes.dart';

//测试用的网络图片
var networkImgUrl =
    "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3865120497,1233684244&fm=26&gp=0.jpg";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(key: Key("Flutter"), title: 'Flutter Demo Home Page'),
      //注册命名路由
      routes: {
        "/": (context) =>
            MyHomePage(key: Key("Flutter"), title: 'Flutter Demo Home Page'),
        LIST_DEMO: (context) => ListViewDemo(),
        LIST_PARALLAX: (context) => ParallaxListDemo()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var redStyle = TextStyle(
      color: Colors.red.shade400, fontSize: 18, fontWeight: FontWeight.bold);
  var blackStyle = TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('Text' * 50,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 26,
                    color: Color(0xaaccdd).withAlpha(250),
                    fontWeight: FontWeight.bold)),

            //混合样式的Text
            Text("混合样式的文本控件"),
            Text.rich(
                TextSpan(children: [
                  TextSpan(text: "红色的文本", style: redStyle),
                  TextSpan(text: ","),
                  TextSpan(text: "黑色的文本", style: blackStyle)
                ]),
                textAlign: TextAlign.center),
            //本地图片
            Text("加载本地图片"),
            Image.asset("images/abnormal.png"),
            //网络图片
            Text("加载网络图片"),
            Image(
              image: NetworkImage(networkImgUrl),
              fit: BoxFit.contain,
              width: 200,
              height: 100,
            ),
            Text("使用第三方库cached_network_image加载图片"),
            SizedBox(
                height: 200,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl: networkImgUrl,
                  alignment: Alignment.center,
                )),
            Text("按钮"),
            TextButton(
              child: SizedBox(
                  child: Text("确定", textAlign: TextAlign.center), width: 200),
              style: ButtonStyle(
                  //字体颜色
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.blue[200];
                    return Colors.yellow[900];
                  })),
              onPressed: () => {
                Fluttertoast.showToast(
                    msg: "我被点击了",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0)
              },
            ),
            //跳转listview页面
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LIST_DEMO);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => new ListViewDemo()));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: SizedBox(
                    child: Text(
                      "跳转ListView示例",
                      textAlign: TextAlign.center,
                    ),
                    width: 160),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.yellow[800];
                  }
                  return Colors.blue;
                }),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LIST_PARALLAX);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => new ListViewDemo()));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: SizedBox(
                    child: Text(
                      "跳转视差效果示例",
                      textAlign: TextAlign.center,
                    ),
                    width: 160),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.yellow[800];
                  }
                  return Colors.blue;
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

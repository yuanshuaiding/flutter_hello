import 'package:flutter/material.dart';

/// 我们既可以通过设置 MaterialApp 全局主题实现应用整体视觉风格的统一，也可以通过 Theme 单子 Widget 容器使用局部主题覆盖全局主题，实现局部独立的视觉风格。
class GlobalThemeDemo extends StatelessWidget {
  final title = "Theme演示";

  final theme1 = ThemeData(
      backgroundColor: Colors.blue,
      primaryColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.grey),
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          button: TextStyle(color: Colors.black12)),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.white, primary: Colors.blue));

  final theme2 = ThemeData(
      backgroundColor: Colors.brown,
      //(按钮)Widget 前景色为黑色
      primaryColor: Colors.amberAccent,
      // 主题色为青色
      iconTheme: IconThemeData(color: Colors.blue),
      //icon 主题色为蓝色
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.red)),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.black, primary: Colors.blue) // 文本主题色为红色
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme2,
      home: ThemeHome(
        key: ObjectKey(key),
        title: title,
        themes: [theme1, theme2],
      ),
    );
  }
}

class ThemeHome extends StatefulWidget {
  final String title;
  final List<ThemeData> themes;

  ThemeHome({required Key key, required this.title, required this.themes})
      : super(key: key);

  @override
  State<ThemeHome> createState() {
    return _MyState();
  }
}

class _MyState extends State<ThemeHome> {
  late bool isLight;

  @override
  void initState() {
    super.initState();
    isLight = true;
  }

  @override
  Widget build(BuildContext context) {
    var theme = isLight ? widget.themes[0] : widget.themes[1];
    return Theme(
        data: theme,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(color: theme.textTheme.bodyText1?.color),
            ),
            backgroundColor: theme.backgroundColor,
          ),
          body: Center(
            child: TextButton(
              child: Text("更换主题"),
              onPressed: () {
                setState(() {
                  isLight = !isLight;
                });
              },
            ),
          ),
        ));
  }
}

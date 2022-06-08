import 'package:flutter/material.dart';

/// 1.自定义widget继承自InheritedWidget，并提供of方法
class CounterContainer extends InheritedWidget {
  static CounterContainer? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterContainer>();

  final _CountHomePageState model;

  CounterContainer({required this.model, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(CounterContainer oldWidget) {
    return oldWidget.model.count != model.count;
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterContainer? state = CounterContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件数据传递"),
      ),
      body: Center(
        child: Text("button pushed times:${state?.model.count ?? -1} "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          state?.model._increament();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountHomePageState();
}

class _CountHomePageState extends State<CounterHomePage> {
  int count = 0;

  void _increament() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterContainer(model: this, child: Counter());
  }
}

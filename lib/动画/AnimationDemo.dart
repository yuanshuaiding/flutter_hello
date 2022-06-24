import 'package:flutter/material.dart';

///渐变动画

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TweenDemo(),
        _AnimationWidgetDemo(),
        _AnimationBuilderDemo(),
      ],
    );
  }
}

class _TweenDemo extends StatefulWidget {
  @override
  State createState() {
    return _TweenState();
  }
}

class _TweenState extends State<_TweenDemo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    var curvedAnim =
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut);
    animation = Tween(begin: 50.0, end: 150.0).animate(curvedAnim)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class _AnimationWidgetDemo extends StatefulWidget {
  @override
  State createState() {
    return _AnimationWidgetState();
  }
}

class _AnimationWidgetState extends State<_AnimationWidgetDemo>
    with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    var curved =
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut);
    animation = Tween(begin: 50.0, end: 150.0).animate(curved);
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return _MyAnimationWidget(animation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class _MyAnimationWidget extends AnimatedWidget {
  _MyAnimationWidget(Animation animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable as Animation;
    return Container(
      width: animation.value,
      height: animation.value,
      child: FlutterLogo(),
    );
  }
}

class _AnimationBuilderDemo extends StatefulWidget {
  @override
  State createState() {
    return _AnimationBuilderState();
  }
}

class _AnimationBuilderState extends State<_AnimationBuilderDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    var curved = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _animation = Tween(begin: 50.0, end: 150.0).animate(curved);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        child: FlutterLogo(),
        animation: _animation,
        builder: (context, child) => Container(
          child: child,
          width: _animation.value,
          height: _animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

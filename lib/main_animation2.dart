import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  final _key = GlobalKey<FadeInWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Center(
        child: FadeInWidget(
          key: _key,
          child: Container(
            color: Colors.red,
            width: 88,
            height: 88,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _key.currentState.start(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class FadeInWidget extends StatefulWidget {
  final Widget child;
  final Function() start;

  const FadeInWidget({
    Key key,
    @required this.child,
    @required this.start,
  }) : super(key: key);

  @override
  FadeInWidgetState createState() => FadeInWidgetState();
}

class FadeInWidgetState extends State<FadeInWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationController.value,
      child: widget.child,
    );
  }

  void start() {
    _animationController
      ..reset()
      ..forward();
  }
}

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

class Page extends StatefulWidget {
  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> with TickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Center(
        child: Opacity(
          opacity: _animationController.value,
          child: Container(
            color: Colors.red,
            width: 88,
            height: 88,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController
            ..reset()
            ..forward();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

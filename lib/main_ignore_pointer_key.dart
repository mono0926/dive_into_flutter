import 'package:dive_into_flutter/util/util.dart';
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
  Page({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  var _ignoring = false;
  final _colors = [Colors.red, Colors.green, Colors.yellow];
  var _current = 0;
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTap: () {
        setState(() => _current++);
      },
      child: MyContainer(
        key: _key,
        color: _colors[_current % 3],
      ),
    );
    return Scaffold(
      body: Center(
        child: _ignoring
            ? IgnorePointer(
                ignoring: _ignoring,
                child: child,
              )
            : child,
      ),
      floatingActionButton: GestureDetector(
        child: Container(
          color: Colors.blue[100],
          width: 88,
          height: 88,
          child: const Icon(Icons.add),
        ),
        onTap: () {
          setState(() => _ignoring = !_ignoring);
        },
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color color;

  const MyContainer({
    Key key,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      color: color,
    );
  }

  @override
  StatelessElement createElement() {
    logger.info('');
    return super.createElement();
  }
}

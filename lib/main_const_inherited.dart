import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  Timer _timer;
  final _formatter = DateFormat('HH:mm:ss');

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_t) => setState(() {}),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TimeInherited(
          time: _formatter.format(DateTime.now()),
          child: const NonsenseWidget(),
        ),
      ),
    );
  }
}

class TimeInherited extends InheritedWidget {
  final String time;
  const TimeInherited({
    Key key,
    @required this.time,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static TimeInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(TimeInherited) as TimeInherited;
  }

  @override
  bool updateShouldNotify(TimeInherited oldWidget) => oldWidget.time != time;
}

class NonsenseWidget extends StatelessWidget {
  const NonsenseWidget();
  @override
  Widget build(BuildContext context) {
    final time = TimeInherited.of(context).time;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Now: $time',
            style: const TextStyle(color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('there'),
              SizedBox(width: 4),
              Text('world!'),
            ],
          ),
        ],
      ),
    );
  }
}

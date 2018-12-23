import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock();
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _counter++),
      child: Text('count: $_counter\ntime: ${DateTime.now()}'),
    );
  }
}

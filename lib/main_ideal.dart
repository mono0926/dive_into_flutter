import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClockPage(),
    );
  }
}

class ClockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock'),
      ),
      body: Center(
//        child: Ideal(),
        child: NotIdeal(),
      ),
    );
  }
}

class Ideal extends StatefulWidget {
  @override
  _IdealState createState() => _IdealState();
}

class _IdealState extends State<Ideal> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Ideal',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class NotIdeal extends StatefulWidget {
  @override
  _NotIdealState createState() => _NotIdealState();
}

class _NotIdealState extends State<NotIdeal> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Not Ideal',
      style: TextStyle(color: Colors.black),
    );
  }
}

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
  var _isLight = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isLight ? ThemeData.light() : ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sample'),
        ),
        body: const Center(
          child: Text(
            'Hello',
            style: TextStyle(fontSize: 32),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() => _isLight = !_isLight);
          },
        ),
      ),
    );
  }
}

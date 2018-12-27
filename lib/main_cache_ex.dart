import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Page()));

class Page extends StatefulWidget {
  Page({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  int _counter = 0;
  static const _myText = MyText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _myText,
//          MyText(),
          Text('$_counter'),
          GestureDetector(
            child: Container(
              color: Colors.blue[100],
              width: 88,
              height: 88,
              child: const Icon(Icons.add),
            ),
            onTap: () {
              setState(() => _counter++);
            },
          )
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText();
  @override
  Widget build(BuildContext context) {
    return Text('my text');
  }

  @override
  StatelessElement createElement() {
    return super.createElement();
  }
}

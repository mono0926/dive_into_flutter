import 'package:flutter/material.dart';

import 'widget/clock.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  final _myStatefulKey1 = GlobalKey<_MyStatefulState>();
  final _myStatefulKey2 = GlobalKey<_MyStatefulState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            // Counterは偶数の時のみリビルド
            Inherited(
              count: _counter,
              condition: (x) => x.isEven,
              // ここで断ち切れる
              child: const Counter(),
            ),
            // Counterは偶数の時のみリビルド
            Inherited(
              count: _counter,
              condition: (x) => x.isOdd,
              // ここで断ち切れる
              child: const Counter(),
            ),
            const SizedBox(height: 88),
            const Clock(),
          ]..addAll(_counter.isEven
              ? [
                  Container(
                      child:
                          Container(child: MyStateful(key: _myStatefulKey1))),
                  Container(child: MyStateful(key: _myStatefulKey2))
                ]
              : [
                  Container(child: MyStateful(key: _myStatefulKey2)),
                  Container(
                      child: Container(child: MyStateful(key: _myStatefulKey1)))
                ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() => _counter++);
        },
      ),
    );
  }
}

class Inherited extends InheritedWidget {
  final int count;
  final bool Function(int) condition;

  const Inherited({
    Key key,
    @required this.count,
    @required this.condition,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static Inherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Inherited) as Inherited;
  }

  // countが変化して、かつ偶数の時のみ伝える
  @override
  bool updateShouldNotify(Inherited oldWidget) =>
      count != oldWidget.count && condition(count);
}

class Counter extends StatelessWidget {
  const Counter();

  @override
  Widget build(BuildContext context) {
    final inherited = Inherited.of(context);
    return Text(
      '${inherited.count}',
      style: Theme.of(context).textTheme.display1,
    );
  }
}

class MyStateful extends StatefulWidget {
  MyStateful({Key key}) : super(key: key);

  @override
  _MyStatefulState createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      color: Colors.red,
    );
  }
}

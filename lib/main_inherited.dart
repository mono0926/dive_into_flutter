import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
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

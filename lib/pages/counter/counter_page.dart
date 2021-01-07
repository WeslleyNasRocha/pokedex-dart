import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app_module.dart';
import 'package:pokedex/store/counter/counter_store.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final Counter counter = Inject<AppModule>.of().get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the buttons this many times:'),
            Observer(
                builder: (_) => Text(
                      "${counter.value}",
                      // "teste",
                      style: const TextStyle(fontSize: 20),
                    )),
            Container(
              child: FlatButton(
                  onPressed: () => Modular.to.pushNamed('/pokemon'),
                  child: Text('oi')),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

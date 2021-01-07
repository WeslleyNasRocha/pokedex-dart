import 'package:mobx/mobx.dart';
part 'counter_store.g.dart';

class Counter = _CounterBase with _$Counter;

abstract class _CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

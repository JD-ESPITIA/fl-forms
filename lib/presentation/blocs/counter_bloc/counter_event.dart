part of 'counter_bloc.dart';

abstract class CounterEvent{
  const CounterEvent();

}

class CounterIncreased extends CounterEvent{
  final int valueIncrease;
  const CounterIncreased(this.valueIncrease);
}


class CounterReset extends CounterEvent {}
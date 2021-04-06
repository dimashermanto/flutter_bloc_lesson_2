import 'package:bloc/bloc.dart';

class CounterState{
  int counterValue;
  bool wasIncremented;

  CounterState({this.counterValue, this.wasIncremented});

}
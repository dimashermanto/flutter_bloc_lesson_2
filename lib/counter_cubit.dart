import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_lesson_2/counter_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState(counterValue: 0));

  //state.counterValue is how we get current counterValue value
  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false));

}
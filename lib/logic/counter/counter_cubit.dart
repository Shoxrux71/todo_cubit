import 'package:bloc/bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(0));

  void increment() async {
    emit(CunterLoading(state.number));
    await Future.delayed(const Duration(seconds: 3));
    // emit(CounterCounted(state.number + 1));
    emit(CounterError('not network!!', state.number));
    print(state);
  }

  void decrement() async {
    emit(CunterLoading(state.number));
    await Future.delayed(const Duration(seconds: 3));
    emit(CounterCounted(state.number - 1));
  }
}

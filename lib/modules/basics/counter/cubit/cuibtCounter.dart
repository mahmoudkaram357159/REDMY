
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cuibtStates.dart';
class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialState());
  int counter=1;
  //to get object from this class easy;;;
  static CounterCubit get(context)=>BlocProvider.of(context);
  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }
  void minus(){
    counter--;
    emit(CounterPlusState(counter));
  }

}
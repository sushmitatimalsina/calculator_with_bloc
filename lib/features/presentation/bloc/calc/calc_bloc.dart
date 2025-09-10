import 'package:calculator/features/domain/repositories/calculator_repo.dart';
import 'package:calculator/features/presentation/bloc/calc/calc_event.dart';
import 'package:calculator/features/presentation/bloc/calc/calc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  final CalculatorRepo calculatorRepo = CalculatorRepo();

  CalcBloc() : super(CalcInitial()) {
    on<AddEvent>((event, emit) {
     final result = calculatorRepo.add(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));
    });

    on<SubtractEvent>((event, emit) {
    final result = calculatorRepo.subtract(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));
    });

    on<MultiplyEvent>((event, emit) {
       final result = calculatorRepo.multiply(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));
    });

    on<DivideEvent>((event, emit) {
       final result = calculatorRepo.divide(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));
    });
  }
}

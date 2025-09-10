import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/calculator_repo.dart';
import 'calc_event.dart';
import 'calc_state.dart';
import '../../../data/local_storage/calculator_local_storage.dart'; // import storage

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  final CalculatorRepo calculatorRepo = CalculatorRepo();
  final CalculatorLocalStorage storage = CalculatorLocalStorage();

  CalcBloc() : super(CalcInitial()) {
    on<AddEvent>((event, emit) async {
      final result = calculatorRepo.add(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));

      await storage.saveCalculation('${event.num1} + ${event.num2} = $result');
    });

    on<SubtractEvent>((event, emit) async {
      final result = calculatorRepo.subtract(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));

      await storage.saveCalculation('${event.num1} - ${event.num2} = $result');
    });

    on<MultiplyEvent>((event, emit) async {
      final result = calculatorRepo.multiply(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));

      await storage.saveCalculation('${event.num1} × ${event.num2} = $result');
    });

    on<DivideEvent>((event, emit) async {
      final result = calculatorRepo.divide(num1: event.num1, num2: event.num2);
      emit(CalcResultState(result: result));

      await storage.saveCalculation('${event.num1} ÷ ${event.num2} = $result');
    });
  }
}

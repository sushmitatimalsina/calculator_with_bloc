abstract class CalcState {}

final class CalcInitial extends CalcState {}

final class CalcResultState extends CalcState {
  final num result;
  CalcResultState({required this.result});
}
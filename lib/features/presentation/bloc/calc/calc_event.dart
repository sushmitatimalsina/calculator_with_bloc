abstract class CalcEvent {}

  class AddEvent extends CalcEvent {
  final num num1;
  final num num2;
 AddEvent({required this.num1, required this.num2});
  
}

  class SubtractEvent extends CalcEvent {
  final num num1;
  final num num2;
  SubtractEvent({required this.num1, required this.num2});
  
}

  class MultiplyEvent extends CalcEvent {
  final num num1;
  final num num2;
  MultiplyEvent({required this.num1, required this.num2});
  
}
  class DivideEvent extends CalcEvent {
  final num num1;
  final num num2;
  DivideEvent({required this.num1, required this.num2});
  
}
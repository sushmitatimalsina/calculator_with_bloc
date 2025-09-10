import 'package:calculator/features/domain/repositories/calculator_repo.dart';
import 'package:calculator/features/presentation/bloc/calc/calc_bloc.dart';
import 'package:calculator/features/presentation/bloc/calc/calc_event.dart';
import 'package:calculator/features/presentation/bloc/calc/calc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcHomePage extends StatelessWidget {
  CalcHomePage({super.key});

  final TextEditingController _controllerFirstNum = TextEditingController();
  final TextEditingController _controllerSecondNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final calcBloc = BlocProvider.of<CalcBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculator with Bloc'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _controllerFirstNum,
                decoration: const InputDecoration(
                  labelText: 'First Number',
                  hintText: 'Enter first number',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerSecondNum,
                decoration: const InputDecoration(
                  labelText: 'Second Number',
                  hintText: 'Enter second number',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (_controllerFirstNum.text.isNotEmpty &&
                          _controllerSecondNum.text.isNotEmpty) {
                        num num1 = num.parse(_controllerFirstNum.text);
                        num num2 = num.parse(_controllerSecondNum.text);
                        calcBloc.add(AddEvent(num1: num1, num2: num2));
                      }
                    },
                    child: const Text('+', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controllerFirstNum.text.isNotEmpty &&
                          _controllerSecondNum.text.isNotEmpty) {
                        num num1 = num.parse(_controllerFirstNum.text);
                        num num2 = num.parse(_controllerSecondNum.text);
                        calcBloc.add(SubtractEvent(num1: num1, num2: num2));
                      }
                    },
                    child: const Text('-', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controllerFirstNum.text.isNotEmpty &&
                          _controllerSecondNum.text.isNotEmpty) {
                        num num1 = num.parse(_controllerFirstNum.text);
                        num num2 = num.parse(_controllerSecondNum.text);
                        calcBloc.add(MultiplyEvent(num1: num1, num2: num2));
                      }
                    },
                    child: const Text('*', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controllerFirstNum.text.isNotEmpty &&
                          _controllerSecondNum.text.isNotEmpty) {
                        num num1 = num.parse(_controllerFirstNum.text);
                        num num2 = num.parse(_controllerSecondNum.text);
                        calcBloc.add(DivideEvent(num1: num1, num2: num2));
                      }
                    },
                    child: const Text('/', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder
              
              <CalcBloc, CalcState>(
                bloc: calcBloc,
                builder: (context, state) {
                  if (state is CalcResultState) {
                    return Text(
                      'Result: ${state.result}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return const Text(
                      'No Result',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

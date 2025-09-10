import 'package:calculator/features/presentation/bloc/calc/calc_bloc.dart';
import 'package:calculator/features/presentation/bloc/calc/calc_event.dart';
import 'package:calculator/features/presentation/bloc/calc/calc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local_storage/calculator_local_storage.dart';

class CalcHomePage extends StatefulWidget {
  const CalcHomePage({super.key});

  @override
  State<CalcHomePage> createState() => _CalcHomePageState();
}

class _CalcHomePageState extends State<CalcHomePage> {
  final TextEditingController _controllerFirstNum = TextEditingController();
  final TextEditingController _controllerSecondNum = TextEditingController();
  final CalculatorLocalStorage storage = CalculatorLocalStorage();

  List<String> history = [];
  num? result;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  void _loadHistory() async {
    final loadedHistory = await storage.loadHistory();
    setState(() {
      history = loadedHistory;
    });
  }

  void _performCalc(BuildContext context, String operation) {
    if (_controllerFirstNum.text.isEmpty || _controllerSecondNum.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please enter both numbers')));
      return;
    }

    late num num1;
    late num num2;

    try {
      num1 = num.parse(_controllerFirstNum.text);
      num2 = num.parse(_controllerSecondNum.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid number input')));
      return;
    }

    final bloc = context.read<CalcBloc>();

    switch (operation) {
      case 'add':
        bloc.add(AddEvent(num1: num1, num2: num2));
        break;
      case 'subtract':
        bloc.add(SubtractEvent(num1: num1, num2: num2));
        break;
      case 'multiply':
        bloc.add(MultiplyEvent(num1: num1, num2: num2));
        break;
      case 'divide':
        if (num2 == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cannot divide by zero')));
          return;
        }
        bloc.add(DivideEvent(num1: num1, num2: num2));
        break;
    }

    // Reload history after calculation
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalcBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Calculator with BLoC')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controllerFirstNum,
                decoration: const InputDecoration(labelText: 'First Number'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerSecondNum,
                decoration: const InputDecoration(labelText: 'Second Number'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => _performCalc(context, 'add'),
                      child: const Text('+')),
                  ElevatedButton(
                      onPressed: () => _performCalc(context, 'subtract'),
                      child: const Text('-')),
                  ElevatedButton(
                      onPressed: () => _performCalc(context, 'multiply'),
                      child: const Text('×')),
                  ElevatedButton(
                      onPressed: () => _performCalc(context, 'divide'),
                      child: const Text('÷')),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<CalcBloc, CalcState>(
                builder: (context, state) {
                  if (state is CalcResultState) {
                    result = state.result;
                    return Text(
                      'Result: ${state.result}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return Text(
                      result == null ? 'No Result' : 'Result: $result',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text('History:', style: TextStyle(fontSize: 18)),
              Expanded(
                child: history.isEmpty
                    ? const Text('No history yet.')
                    : ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(history[index]));
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

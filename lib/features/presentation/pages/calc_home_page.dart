import 'package:calculator/features/domain/repositories/calculator_repo.dart';
import 'package:flutter/material.dart';

class CalcHomePage extends StatefulWidget {
  const CalcHomePage({super.key});

  @override
  State<CalcHomePage> createState() => _CalcHomePageState();
}

class _CalcHomePageState extends State<CalcHomePage> {
  final TextEditingController _controllerFirstNum = TextEditingController();
  final TextEditingController _controllerSecondNum = TextEditingController();
  num result = 0;

  final calculatorRepo = CalculatorRepo();

  @override
  Widget build(BuildContext context) {
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
                style: const TextStyle(
                  fontSize: 2,
                  fontWeight: FontWeight.w500,
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
                style: const TextStyle(
                  fontSize: 2,
                  fontWeight: FontWeight.w500,
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
                        setState(() {
                          result = calculatorRepo.add(num1: num1, num2: num2);
                        });
                      }
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                      if (_controllerFirstNum.text.isNotEmpty &&
                          _controllerSecondNum.text.isNotEmpty) {
                        num num1 = num.parse(_controllerFirstNum.text);
                        num num2 = num.parse(_controllerSecondNum.text);
                        setState(() {
                          result = calculatorRepo.subtract(num1: num1, num2: num2);
                        });
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
                        setState(() {
                          result = calculatorRepo.multiply(num1: num1, num2: num2);
                        });
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
                        setState(() {
                          result = calculatorRepo.divide(num1: num1, num2: num2);
                        });
                      }
                    },
                    child: const Text('/', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),

              const SizedBox(height: 20),

         
              Text(
                'Result: $result',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

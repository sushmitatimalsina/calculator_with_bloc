

import 'package:shared_preferences/shared_preferences.dart';

class CalculatorLocalStorage {
  static const _historyKey = 'calc_history';

  
  Future<void> saveCalculation(String calculation) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_historyKey) ?? [];
    history.add(calculation);
    await prefs.setStringList(_historyKey, history);
  }


  Future<List<String>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_historyKey) ?? [];
  }


  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}


class CalculatorRepo {

  add({
    required num num1,
    required num num2,
  }){
    return num1 + num2;
  }

  subtract({
    required num num1,
    required num num2,
  }){
    return num1 - num2;
  }

  multiply({
    required num num1,
    required num num2,
  })
  {
    return num1 * num2;
  }
   
   divide({
    required num num1,
    required num num2,
   }){
    if(num2 == 0){
      throw Exception("Cannot divide by zero");
    }
    return num1 / num2;
   }
}
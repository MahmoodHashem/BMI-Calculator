
import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double? _bmi;
  String bmiCalculation(){
    _bmi = weight / pow(height/ 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi! > 25){
      return "Overweight";
    }else if(_bmi! > 18.5 ){
      return "Normal";
    }else{
      return "Underweight";
    }
  }

  String getInterpretation(){
    if(_bmi! > 25){
      return "You are overweight. You should exercise and eat healthy.";
    }else if(_bmi! > 18.5 ){
      return "Your weight is normal. Good job! ";
    }else{
      return "You are under weight, eat more! ";
    }
  }

}
import 'dart:math';
class CalCulatorBrain {

  CalCulatorBrain({this.height, this.weight});

   final int height;
   final int weight;

   double _bmi;

   String calculateBMI() {
     _bmi = weight / pow(height/100, 2);
     return _bmi.toStringAsFixed(2);
   }
   String getresult() {
     if(_bmi >= 25) {
       return "Overweight";
     }
       else if (_bmi > 18.5) {
         return "Normal";
     }
       else {
         return "Underweight";
     }
     }
     String getInterpretation() {
       if(_bmi >= 25) {
         return "Your body weight is higher than normal body weight. Try to exercise more.";
       }
       else if (_bmi > 18.5) {
         return "You have normal body weight. Good Job!";
       }
       else {
         return "Your body weight is lower than normal body weight. Try to gain more.";
       }
     }
}
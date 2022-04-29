import 'dart:math';
import 'package:imc_calculator/constants.dart';
import 'package:imc_calculator/result_object.dart';

class CalculatorBrain {
  final int? weight;
  final int? height;
  final int? age;
  final int? gender;

  CalculatorBrain({this.weight, this.height, this.age, this.gender});

  double? _bmi;

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  results_object getResult() {
    results_object result = results_object();

    if (_bmi! <= 18.5) {
      result.resultText = "Abaixo do peso";
      result.resultTextStyle = kresultsTextPesoAbaixoStyle;
    } else if (_bmi! > 18.5 && _bmi! <= 24.9) {
      result.resultText = "Peso normal";
      result.resultTextStyle = kresultsTextPesoNormalStyle;
    } else if (_bmi! > 24.9 && _bmi! <= 29.9) {
      result.resultText = "Acima do peso";
      result.resultTextStyle = kresultsTextSobrePesoStyle;
    } else if (_bmi! > 29.9 && _bmi! <= 34.9) {
      result.resultText = "Obesidade nível 1";
      result.resultTextStyle = kresultsTextPesoAcimaStyle;
    } else if (_bmi! > 34.9 && _bmi! <= 39.9) {
      result.resultText = "Obesidade nível 2";
      result.resultTextStyle = kresultsTextPesoAcimaStyle;
    } else {
      result.resultText = "Obesidade nível 3";
      result.resultTextStyle = kresultsTextPesoAcimaStyle;
    }

    return result;
  }

  String getBasalMetabolism() {
    double tmbResult = 0;

    if (age! >= 10 && age! <= 18) {
      gender == 1 ? tmbResult = 12.2 * weight! + 746 : tmbResult = 17.5 * weight! + 651;
    } else if (age! > 18 && age! <= 30) {
      gender == 1 ? tmbResult = 14.7 * weight! + 496 : tmbResult = 15.3 * weight! + 679;
    } else if (age! > 30 && age! <= 60) {
      gender == 1 ? tmbResult = 8.7 * weight! + 829 : tmbResult = 8.7 * weight! + 879;
    } else if (age! > 60) {
      gender == 1 ? tmbResult = 10.5 * weight! + 596 : tmbResult = 13.5 * weight! + 487;
    }

    return "Taxa de Metabolismo Basal:\n" + tmbResult.toStringAsFixed(0);
  }
}
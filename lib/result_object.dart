import 'package:flutter/cupertino.dart';

class results_object {
  String? resultText;
  TextStyle? resultTextStyle;

  results_object(
      {this.resultText,
        this.resultTextStyle});

  factory results_object.fromJson(Map<String, dynamic> json) {
    return results_object(
        resultText: json['resultText'],
        resultTextStyle: json['resultTextStyle']
    );
  }
}
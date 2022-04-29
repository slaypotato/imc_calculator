import 'package:imc_calculator/screens/input_page.dart';
import 'package:imc_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      routes: {
        "/results": (context) => const ResultsPage(),
      },
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
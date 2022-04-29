// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:imc_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardcolor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "Homem",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardcolor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "Mulher",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              color: kInactiveCardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Altura",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(" cm", style: kLabelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFF0BAECB),
                      overlayColor: const Color(0x290BAECB),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: const Color(0xFF0BAECB),
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              //onPress: ,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: kInactiveCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Peso",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: kInactiveCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Idade",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              if (selectedGender == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: const Text('Selecione o gênero', style: kresultsTextPesoAcimaStyle),
                    )
                );
              } else {
                CalculatorBrain calc = CalculatorBrain(weight: weight,
                    height: height,
                    age: age,
                    gender: selectedGender!.index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            result: calc.getResult(),
                            basalMetabolism: calc.getBasalMetabolism()
                        ),
                  ),
                );
              }
            },
            buttonTitle: "Calcular",),
        ],
      ),
    );
  }
}
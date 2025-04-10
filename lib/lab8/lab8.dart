import 'package:client/lab8/calculator_brain.dart';
import 'package:client/lab8/component/reusable_card.dart';
import 'package:client/lab8/component/round_icon_button.dart';
import 'package:client/lab8/constants.dart';
import 'package:client/lab8/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

enum Gender { male, female }

class Lab8 extends StatefulWidget {
  const Lab8({super.key});

  @override
  State<Lab8> createState() => _Lab8State();
}

class _Lab8State extends State<Lab8> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                buildGenderCard(Gender.male, Icons.male, 'MALE'),
                buildGenderCard(Gender.female, Icons.female, 'FEMALE'),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: const Color(0xFFEB1555),
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (value) {
                      setState(() => height = value.round());
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildCounterCard('WEIGHT', weight, (val) {
                  setState(() => weight += val);
                }),
                buildCounterCard('AGE', age, (val) {
                  setState(() => age += val);
                }),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text('CALCULATE', style: kLargeButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildGenderCard(Gender gender, IconData icon, String label) {
    bool isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = gender),
        child: ReusableCard(
          color: isSelected ? kActiveCardColor : kInactiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80),
              const SizedBox(height: 15),
              Text(label, style: kLabelTextStyle),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildCounterCard(String label, int value, Function(int) onChanged) {
    return Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: kLabelTextStyle),
            Text(value.toString(), style: kNumberTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(icon: Icons.remove, onPressed: () => onChanged(-1)),
                const SizedBox(width: 10),
                RoundIconButton(icon: Icons.add, onPressed: () => onChanged(1)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:client/lab8/component/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI RESULT')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text('Your Result', style: kTitleTextStyle, textAlign: TextAlign.center),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle),
                  Text(bmiResult, style: kBMITextStyle),
                  Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text('RE-CALCULATE', style: kLargeButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

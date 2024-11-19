import 'package:flutter/material.dart';
import 'buttom_button.dart';
import 'constants.dart';
import 'reusable_card.dart';




class ResultsPage extends StatelessWidget {

  const ResultsPage({super.key, required this.bmiResult, required this.interpretation, required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text('Your Result',
                style: kTittleTextStyle),
          ),
          ),
          Expanded(flex:5,
              child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,),
            Text(bmiResult,
                      style: kBMIStyle,),
            Text( interpretation,
                      style: krResult,
                      textAlign: TextAlign.center
            ),
                    ],
                  ),
                onPress: () {},
              ),
          ),
          BottomButton(
            buttonTitle:'Re-CALCULATE',
            onTap: () {
              Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}


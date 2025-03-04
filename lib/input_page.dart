import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'round_button.dart';
import 'buttom_button.dart';
import 'calculator_brain.dart';



enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 150;
  int weight = 60;
  int age = 20;

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColor = inactiveCardColour;

  // 1 = male, 2 = female
  // void updateColour(Gender selectedgender) {
  //
  //   // male card pressed
  //   if (selectedgender == Gender.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColour;
  //       femaleCardColor = inactiveCardColour;
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  //   // female card pressed
  //   if (selectedgender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColour){
  //       femaleCardColor = activeCardColour;
  //       maleCardColour = inactiveCardColour;
  //     } else {
  //       femaleCardColor = inactiveCardColour;
  //     }
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child:
                ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                    colour:selectedGender ==Gender.male? kActiveCardColour: kInactiveCardColour,
                cardChild:const IconContent(
                  icon: FontAwesomeIcons.mars,
                    label: 'Male',
                ),
                ),
              ),
              Expanded(
                child:
                ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female? kActiveCardColour: kInactiveCardColour,
                  cardChild: const IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
                ),
              ),
            ],
          ),
          ),
           Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('HEIGHT',
                style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                        height.toString(),
                        style:
                        knumberText),
                  const Text('cm',
                    style: knumberText,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    overlayColor:const  Color(0x29EB1555),
                    thumbColor: const Color(0xFFEB1555),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 15.0
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 30.0
                    ),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ), onPress: () {  },
            ),
          ),
           Expanded(
            child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    colour: kActiveCardColour,
                  cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Weight',style: kLabelTextStyle),
                    Text(weight.toString(), style: knumberText),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),

                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ],
                    ),
  ],
    ), onPress: () {  },
  ),
  ),
              Expanded(
                child:
              ReusableCard(
                  colour: kActiveCardColour,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('AGE',
                    style: kLabelTextStyle,),
                  Text(age.toString(),
                    style: knumberText
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed:() {
                        setState(() {
                          age--;
                      });
                      }
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: () {
                        setState(() {
                          age++;
                        });
                          }
                          ),
                    ],
                  )
                ],
              ), onPress: () {  },
              ),
              ),
            ],
          ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText:calc.getResult(),
                    interpretation:calc.getInterpretation(),
                  ),),);
            },
          ),
        ],
      ),
    );
  }
}





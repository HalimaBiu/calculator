import 'package:flutter/material.dart';
import 'input_page.dart';


void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
            primaryColor: const Color(0x0ff0ae21),
            scaffoldBackgroundColor:const Color(0x0ff0ae21),
        ),
      home: const InputPage(),
    );
  }
}





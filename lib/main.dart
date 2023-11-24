import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(primary: const Color(0xFF0A0D22),),
          scaffoldBackgroundColor: const Color(0xFF0A0D22),
        ),
        home: const InputPage(),
    );
  }
}




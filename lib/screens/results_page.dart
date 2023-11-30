
import 'package:bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_container.dart';
class Result extends StatelessWidget {
   Result({Key? key, required this.result, required this.bmi, required this.interpretation}) : super(key: key);

  final String result;
  final String bmi;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result, style: const TextStyle(fontSize: 30, color: Colors.green),),
                  Text(bmi, style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
                  Text(interpretation, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20), ),
                ],
              ),
            ),
          ),
          BottomContainer(
              navigate:()=> Navigator.pop(context),
              title: "RE-CALCULATE"),
        ],
      ),
    );
  }
}

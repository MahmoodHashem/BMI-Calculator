import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bmi/models/preference_services.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage(
      {Key? key,
      required this.bmi,
      required this.result,
      required this.height,
      required this.weight,
      required this.hour,
      required this.month});

  final List<String> height;
  final List<String> weight;
  final List<String> bmi;
  final List<String> result;
  final List<String> hour;
  final List<String> month;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  PreferenceService _preference = PreferenceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Container(
          color: Colors.grey,
          child:  ListView.builder(
              itemBuilder: (context, i) {
                return ReusableCard(
                  cardMargin: const EdgeInsets.all(8),
                  colour: kActiveCardColour,
                  cardChild: ListTile(
                    title: Text(
                        "BMI: ${widget.bmi[i]}\t\t Result: ${widget.result[i]}\nHeight: ${widget.height[i]} \t\t Weight: ${widget.weight[i]}"),
                    subtitle: Text("\n${widget.hour[i]} ${widget.month[i]} "),
                  ),
                );
              },
              itemCount: widget.bmi.length)),
    );
  }
}

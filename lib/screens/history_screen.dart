
import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class HistoryPage extends StatelessWidget {
   HistoryPage({Key? key, required this.bmi, required this.result});


  final List<String> bmi;
  final List<String> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Last One"),
      ),
      body: Container(
        color: Colors.grey,
        child:  ListView.separated(
            itemBuilder: (context, i){
              return ListTile(
                title: Text("BMI: ${bmi[i]}\t Result: ${result[i]}"),
                subtitle: Text("${i+1}"),
              );
            },
            separatorBuilder: (context, i){
              return Divider();
            },
            itemCount: bmi.length)
      ),
    );
  }
}


import '../constants.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {

  BottomContainer({required this.navigate, required this.title});


  final Function()? navigate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:navigate,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        child:Center(child:  Text(title, style:kResultBottunStyle)),
      ),
    );
  }
}
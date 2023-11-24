
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPress});

  final IconData? icon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0
      ),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
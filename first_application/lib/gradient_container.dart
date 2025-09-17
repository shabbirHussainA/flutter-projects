import 'package:first_application/dice_roller.dart';
import 'package:first_application/styled_text.dart';
import 'package:flutter/material.dart';

var beginningAlignment = Alignment.topLeft;
var endingAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  GradientContainer(this.colors, {super.key});
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: beginningAlignment,
          end: endingAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}

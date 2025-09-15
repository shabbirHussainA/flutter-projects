import 'package:first_application/styled_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>{
    var diceImage = 'assets/dice-2.png';
  void rollDice() {
    // Random().nextInt(6)+1;
    const diceImages = [
      'assets/dice-1.png',
      'assets/dice-2.png',
      'assets/dice-3.png',
      'assets/dice-4.png',
      'assets/dice-5.png',
      'assets/dice-6.png',
    ];
    setState(() {
    
    diceImage = diceImages[Random().nextInt(6)];
    });
    print('Dice rolled!');
  }
  Widget build(context){
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(diceImage, width: 200),
            const SizedBox(height: 20),
            TextButton(onPressed: rollDice, child: const StyledText('Roll Dice')),
          ],
        );
  }

}
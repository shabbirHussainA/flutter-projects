import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{
  const StyledText(this.text, {super.key});
  final String text;

  @override
  Widget build(context) {
    return Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34.0, color: Colors.white),
        );
  }
}
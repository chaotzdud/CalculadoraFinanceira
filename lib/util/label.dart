import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;

  const Label(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 26),
      ),
    );
  }
}

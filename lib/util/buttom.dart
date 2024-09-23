import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  final String _text;
  final void Function() _onClick;

  const Buttom(this._text, this._onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        
        child: ElevatedButton(
            onPressed: _onClick,
            child: Text(_text)
        )
      );
  }
}

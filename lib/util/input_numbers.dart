import 'package:calculadora_de_juros/util/label.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String _info;
  final TextEditingController _controller;

  const TextBox(this._info, this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Label("$_info:"),
        const SizedBox(height: 5),
        TextField(
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              hintText: "Entre com o valor desejado",
              border: OutlineInputBorder(borderSide: BorderSide(width: 1.0))),
          controller: _controller,
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}

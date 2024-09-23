import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraJuros());
}

class CalculadoraJuros extends StatelessWidget {
  const CalculadoraJuros({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Juros',
    );
  }
}

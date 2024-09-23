import 'package:calculadora_de_juros/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraJuros());
}

class CalculadoraJuros extends StatelessWidget {
  const CalculadoraJuros({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Juros',
      
      home: const TiposJuros(title: 'Calculadora de Juros'),
      routes: Routes.load()

    );
  }
}

class TiposJuros extends StatelessWidget{
  const TiposJuros({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
    );
  }
}

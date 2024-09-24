import 'package:calculadora_de_juros/routes/routes.dart';
import 'package:calculadora_de_juros/util/buttom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraJuros());
}

class CalculadoraJuros extends StatelessWidget {
  const CalculadoraJuros({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Juros',
      
      home: const TelaPrincipal(title: 'Calculadora Financeira'),
      routes: Routes.load()

    );
  }
}

class TelaPrincipal extends StatelessWidget{
  const TelaPrincipal({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Buttom('Juros Simples', Routes.call(context, '/juros-simples')),
            Buttom('Juros Compostos', Routes.call(context, '/juros-compostos'))
          ],
        )
      )
    );
  }
}

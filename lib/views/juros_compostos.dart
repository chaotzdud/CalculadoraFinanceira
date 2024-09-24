import 'package:calculadora_de_juros/model/Juros.dart';
import 'package:calculadora_de_juros/util/input_numbers.dart';
import 'package:calculadora_de_juros/views/default_screen.dart';
import 'package:flutter/material.dart';


import '../../routes/routes.dart';
import '../../util/buttom.dart';

class JurosCompostos extends StatefulWidget {
  const JurosCompostos({super.key});

  @override
  JurosCompostosState createState() => JurosCompostosState();
}

class JurosCompostosState extends State<JurosCompostos> {
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _taxaController = TextEditingController();
  final TextEditingController _tempoController = TextEditingController();


  void _calcularJurosCompostos() {
    double capital = double.tryParse(_capitalController.text) ?? 0.0;
    double taxa = double.tryParse(_taxaController.text) ?? 0.0;
    double tempo = double.tryParse(_tempoController.text) ?? 0.0;
    
    Juros juros = Juros.jurosCompostos(c: capital, i: taxa, t: tempo);
    Routes.pushNamed(context, '/result', juros);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen('Cálculo Juros Compostos', <Widget>[
      TextBox('Digite o capital', _capitalController),
      TextBox('Digite a taxa', _taxaController),
      TextBox('Digite o tempo', _tempoController),
      Buttom("Calcular", _calcularJurosCompostos)
    ]);
  }
}


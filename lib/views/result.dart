import 'package:calculadora_de_juros/model/Juros.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  ResultState createState() => ResultState();
}

class ResultState extends State<Result> {
  void _onItemTapped(int index) {
    if (index == 0) {
      Routes.pop(context);
    } else if (index == 1) {
      Routes.call(context, "/main")();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Juros j = ModalRoute.of(context)!.settings.arguments as Juros;

    final juros = j.juros;
    final montante = j.montante;
    final capital = j.capital;
    final taxa = j.taxa;
    final tempo = j.tempo;
    final tipo = j.tipo;

    return MaterialApp(
      title: 'Resultado ($tipo)',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Resultado ($tipo)'),
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Montante: $montante'),
              Text('capital: $capital'),
              Text('taxa: $taxa'),
              Text('Tempo: $tempo'),
              Text('Juros: $juros'),
            ]
          ), 
        ),
      
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.error, color: Colors.black),
              label: 'Corrigir',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.error, color: Colors.black),
              label: 'Novo Cálculo'
            ),

          ],
          onTap: _onItemTapped,
        )
      ),
    );
  }
}

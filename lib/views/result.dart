import 'package:calculadora_de_juros/model/juros.dart';
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
    final Juros juros = ModalRoute.of(context)!.settings.arguments as Juros;

    final montante = juros.montante;
    final capital = juros.capital;
    final taxa = juros.taxa;
    final tempo = juros.tempo;
    final tipo = juros.tipo;

    return MaterialApp(
      title: 'Cálculo de $tipo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cálculo de $tipo'),
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Cálculo do $tipo'),
              Text('Montante: $montante'),
              Text('capital: $capital'),
              Text('taxa: $taxa'),
              Text('Tempo: $tempo'),
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

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

    return MaterialApp(
      title: 'Titulo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jorge'),
        ),
      ),
    );
  }
}

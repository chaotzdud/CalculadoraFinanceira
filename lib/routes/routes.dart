import 'package:calculadora_de_juros/views/juros_simples.dart';
import 'package:calculadora_de_juros/views/juros_compostos.dart';

import 'package:flutter/material.dart';
import '../main.dart';
import '../views/result.dart';


class Routes {
  static Map<String, Widget Function(BuildContext)> load() {
    return {
      '/main': (context) => const CalculadoraJuros(),
      '/juros-simples': (context) => const JurosSimples(),
      '/juros-compostos': (context) => const JurosCompostos(),
      '/result': (context) => const Result()
    };
  }

  static void Function() call(BuildContext context, String route) {
    return () {
      Navigator.pushNamed(context, route);
    };
  }

  static void pushNamed(BuildContext context, String route,
      [Object data = Object]) {
    Navigator.pushNamed(context, route, arguments: data);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}

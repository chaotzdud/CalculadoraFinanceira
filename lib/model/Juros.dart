import 'dart:math';

class Juros {
  double _juros = 0.0;
  double _montante = 0.0;
  double _capital = 0.0;
  double _taxa = 0.0;
  int _tempo = 0;

  String _tipo = '';

  get juros {
    return _juros.toStringAsFixed(2);
  }

  get montante {
    _montante = _capital + _juros;
    return _montante.toStringAsFixed(2);
  }

  get capital {
    return _capital.toStringAsFixed(2);
  }

  get taxa {
    return _taxa.toStringAsFixed(2);
  }

  get tempo {
    return _tempo.toString();
  }

  get tipo {
    return _tipo;
  }

  Juros() {}

  Juros.jurosSimples({double c = 0.0, double i = 0.0, int t = 0}) {
    _capital = c;
    _taxa = i;
    _tempo = t;

    _juros = _capital * _taxa * _tempo;
    _tipo = 'Juros Simples';
  }

  Juros.jurosCompostos({double c = 0.0, double i = 0.0, int t = 0}) {
    _capital = c;
    _taxa = i;
    _tempo = t;

    _juros = _capital * pow((1 + _taxa), _tempo);
  }
}

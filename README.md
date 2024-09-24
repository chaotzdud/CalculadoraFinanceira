# Calculadora Financeira

Este é um projeto que está sendo desenvolvido como trabalho para a matéria *Programação para Dispositivos Móveis* no curso *Análise e Desenvolvimento de Sistemas*, lecionada pelo prof. Luis Felipe Feres, na Faculdade de Tecnologia de Taubaté (Fatec Taubaté).

## Visão geral

Este projeto consiste na construção de um aplicativo que calcula juros simples e compostos.

## Descrição da tarefa

1. O aplicativo deve ter uma tela inicial que apresenta uma *label* com o texto "Qual operação deseja realizar?", seguido de dois botões: "Calcular Juros Simples" e "Calcular Juros Compostos".
2. O aplicativo deve possuir uma tela para cada operação.
3. O aplicativo deve possuir **apenas uma** tela de resultado, que será compartilhada por ambas operações.
4. O aplicativo deve seguir o modelo de rotas para navegação entre as telas, podendo possuir imagens e/ou outros recursos.

---

## Implementação

### Rotas

```dart
class Routes {
  static Map<String, Widget Function(BuildContext)> load() {
    return {
      '/main': (context) => const CalculadoraJuros(),
      '/juros-simples': (context) => const JurosSimples(),
      '/juros-compostos': (context) => const JurosCompostos(),
      '/result': (context) => const Result()
    };
  }
```

### Tela principal (Menu)

```dart
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
```

### Tela 'Juros Simples'

```dart
class JurosSimplesState extends State<JurosSimples> {
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _taxaController = TextEditingController();
  final TextEditingController _tempoController = TextEditingController();


  void _calcularJurosSimples() {
    double capital = double.tryParse(_capitalController.text) ?? 0.0;
    double taxa = double.tryParse(_taxaController.text) ?? 0.0;
    double tempo = double.tryParse(_tempoController.text) ?? 0.0;
    
    Juros juros = Juros.jurosSimples(c: capital, i: taxa, t: tempo);
    Routes.pushNamed(context, '/result', juros);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen('Cálculo Juros Simples', <Widget>[
      TextBox('Digite o capital', _capitalController),
      TextBox('Digite a taxa', _taxaController),
      TextBox('Digite o tempo', _tempoController),
      Buttom("Calcular", _calcularJurosSimples)
    ]);
  }
}
```

### Tela 'Juros Compostos'

```dart
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
```

### Tela 'Resultado'

```dart
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
```

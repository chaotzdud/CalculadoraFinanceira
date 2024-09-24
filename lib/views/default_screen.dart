import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  final String _title;
  final List<Widget> _components;

  const DefaultScreen(this._title, this._components, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _components,
          ),
        ),
      ),
    );
  }
}

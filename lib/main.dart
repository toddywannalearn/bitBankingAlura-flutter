import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/Themes.dart';
import 'screens/formulario/Lista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes().greenTheme(),
      home: ListaTransferencia(),
    );
  }
}



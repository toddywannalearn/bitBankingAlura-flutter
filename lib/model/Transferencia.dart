import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transferencia{
  final int conta;
  final double valor;

  Transferencia(this.conta, this.valor);

  @override
  String toString() {
    return 'conta: $conta \nvalor: $valor';
  }
}
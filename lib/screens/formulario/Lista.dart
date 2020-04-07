import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Formulario.dart';
import '../../model/Transferencia.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  _ListaTransferenciaState createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Transferências'),
      ),
      body: widget._transferencias.length == 0
          ? emptyList()
          : listaTransferencias(),
      floatingActionButton: floatingAddTransferencia(context),
    );
  }

  Widget emptyList() {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.close,
          color: Colors.red,
        ),
        title: Text('Nenhuma transferencia para ser exibida'),
      ),
    );
  }

  Widget listaTransferencias() {
    return ListView.builder(
      itemCount: widget._transferencias.length,
      itemBuilder: (context, index) {
        final transferencia = widget._transferencias[index];
        return cardTransferencia(transferencia);
      },
    );
  }

  Widget cardTransferencia(Transferencia transferencia) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.conta.toString()),
      ),
    );
  }

  Widget floatingAddTransferencia(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => FormularioTransferencia()),
        ).then((transferenciaRecebida) {
          _atualizaLista(transferenciaRecebida);
        });
      },
    );
  }

  void _atualizaLista(dynamic transferenciaRecebida){
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}
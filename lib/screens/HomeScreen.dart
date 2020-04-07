import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transferenciaScreen.dart';
import '../model/Transferencia.dart';

class HomeScreen extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        final Future<Transferencia> future = Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => TransfScreen()),
        );
        future.then((transferenciaRecebida) {
          Future.delayed(Duration(seconds: 2), () {
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        });
      },
    );
  }
}

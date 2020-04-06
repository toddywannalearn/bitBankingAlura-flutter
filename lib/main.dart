import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transferencia_screen.dart';
import 'Transferencia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

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
        backgroundColor: Colors.green.shade700,
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
        leading: Icon(Icons.close,
        color: Colors.red,),
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
      backgroundColor: Colors.green.shade700,
      child: Icon(Icons.add),
      onPressed: () {
        final Future<Transferencia> future = Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => TransfScreen()),
        );
        future.then((transferenciaRecebida) {
          debugPrint('chegou no then do future');
          debugPrint('$transferenciaRecebida');
          Future.delayed(Duration(seconds: 2));
          if(transferenciaRecebida != null){
            setState(() {
              widget._transferencias.add(transferenciaRecebida);
            });
          }
        });
      },
    );
  }
}

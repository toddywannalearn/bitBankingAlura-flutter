import 'package:bitbanking/Transferencia.dart';
import 'package:flutter/material.dart';
import 'widgets/Editor.dart';
import 'widgets/ContainerQtd.dart';

class TransfScreen extends StatelessWidget {
  final TextEditingController _controllerCampoConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade700,
          title: Text('Formulário'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controller: _controllerCampoConta,
                  label: 'Número da conta',
                  hint: '0000',
                  maxLength: 4),
              Editor(
                  controller: _controllerCampoValor,
                  label: 'Valor',
                  hint: '0.00',
                  icon: Icons.monetization_on),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    int conta = int.tryParse(_controllerCampoConta.text);
    double valor = double.tryParse(_controllerCampoValor.text);

    if (conta != null && valor != null) {
      final transferenciaCriada = Transferencia(conta, valor);
      debugPrint(transferenciaCriada.toString());
      debugPrint('criando transferencia');
      Navigator.pop(context, transferenciaCriada);
    } else {
      debugPrint('A conta ou valor não devem ser nulos');
    }
  }

//  Widget btnConfirmar() {
//    return RaisedButton(
//      color: Colors.blueAccent,
//      child: Text(
//        'Confirmar',
//        style: TextStyle(
//          color: Colors.white,
//        ),
//      ),
//      onPressed: () {
//        int conta = int.tryParse(_controllerCampoConta.text);
//        double valor = double.tryParse(_controllerCampoValor.text);
//        if (conta != null && valor != null) {
//          final transferenciaCriada = Transferencia(conta, valor);
//          debugPrint(transferenciaCriada.toString());
//          debugPrint('criando transferencia');
//          Navigator.pop(context, transferenciaCriada);
//        } else {
//          debugPrint('A conta ou valor não devem ser nulos');
//        }
//      },
//    );
//  }
}

import 'package:bitbanking/model/Transferencia.dart';
import 'package:flutter/material.dart';
import '../../components/Editor.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
    );
  }

  void _criaTransferencia(BuildContext context) {
    int conta = int.tryParse(_controllerCampoConta.text);
    double valor = double.tryParse(_controllerCampoValor.text);

    if (conta != null && valor != null) {
      final transferenciaCriada = Transferencia(conta, valor);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

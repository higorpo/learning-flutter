import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/dashboard/saldo.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SaldoCard(),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Receber depósito'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormularioDeposito()));
                  },
                ),
                RaisedButton(
                  child: Text('Nova transferência'),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormularioTransferencia()));
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            UltimasTransferencias()
          ],
        ),
      ),
    );
  }
}

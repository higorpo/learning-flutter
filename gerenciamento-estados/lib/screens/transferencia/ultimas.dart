import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titulo = 'Últimas transferências';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          final int _quantidade = transferencias.transferencias.length;
          int _tamanho = 2;

          if (_quantidade == 0) {
            return SemTransferenciaCadastrada();
          }

          if (_quantidade < 2) {
            _tamanho = _quantidade;
          }

          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: _tamanho,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Transferencia transferencia = _ultimasTransferencias[index];
              return ItemTransferencia(transferencia);
            },
          );
        }),
        RaisedButton(
          child: Text('Ver todas as transferências'),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListaTransferencias()));
          },
        )
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40.0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Você ainda não cadastrou nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

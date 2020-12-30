import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:provider/provider.dart';

const _tituloAppbar = 'Criando transferências';
const _rotuloCampoNumConta = 'Número da conta';
const _dicaCampoNumConta = '000';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppbar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: _dicaCampoNumConta,
              rotulo: _rotuloCampoNumConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    final bool transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida) {
      final Transferencia novaTransferencia = Transferencia(valor, numeroConta);
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  bool _validaTransferencia(
      BuildContext context, int numeroConta, double valor) {
    final bool _campoPreenchido = numeroConta != null && valor != null;
    final bool _saldoSuficiente = valor <=
        Provider.of<Saldo>(
          context,
          listen: false,
        ).valor;
    return _campoPreenchido && _saldoSuficiente;
  }

  void _atualizaEstado(
    BuildContext context,
    Transferencia novaTransferencia,
    double valor,
  ) {
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrai(valor);
  }
}

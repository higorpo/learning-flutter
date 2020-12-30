import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber deposito';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaDeposito(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final bool depositoValido = _validaDeposito(valor);

    if (depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  bool _validaDeposito(double valor) {
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  void _atualizaEstado(BuildContext context, double valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}

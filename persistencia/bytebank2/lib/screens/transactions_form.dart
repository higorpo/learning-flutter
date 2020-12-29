import 'package:flutter/material.dart';
import 'package:bytebank2/database/dao/transference_dao.dart';
import 'package:bytebank2/models/transference.dart';

class TransactionsForm extends StatefulWidget {
  @override
  _TransactionsFormState createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TransferenceDao _transferenceDao = TransferenceDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '000',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _valueController,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  hintText: '0.00',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () => _createTransaction(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTransaction(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double value = double.tryParse(_valueController.text);

    if (accountNumber != null && value != null) {
      final Transference newTransference =
          Transference(null, accountNumber, value);
      _transferenceDao.save(newTransference);
      Navigator.pop(context);
    }
  }
}

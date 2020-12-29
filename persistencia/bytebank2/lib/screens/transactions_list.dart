import 'package:bytebank2/components/loading_items.dart';
import 'package:bytebank2/models/transference.dart';
import 'package:flutter/material.dart';
import 'package:bytebank2/database/dao/transference_dao.dart';
import 'package:bytebank2/screens/transactions_form.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final TransferenceDao _transferenceDao = TransferenceDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                    MaterialPageRoute(builder: (context) => TransactionsForm()))
                .then((value) => setState(() {}));
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: FutureBuilder<List<Transference>>(
          initialData: List(),
          future: _transferenceDao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return LoadingItems();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Transference> transactions = snapshot.data;
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final Transference transferenceItem = transactions[index];
                    return _TransactionItem(transferenceItem);
                  },
                );
                break;
            }

            return Text('Unknown error');
          },
        ));
  }
}

class _TransactionItem extends StatelessWidget {
  final Transference transference;

  const _TransactionItem(this.transference);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          transference.accountNumber.toString(),
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          transference.value.toString(),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

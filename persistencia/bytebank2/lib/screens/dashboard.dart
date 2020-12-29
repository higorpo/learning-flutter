import 'package:flutter/material.dart';
import 'package:bytebank2/components/card_nav_item.dart';
import 'package:bytebank2/screens/contacts_list.dart';
import 'package:bytebank2/screens/transactions_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CardNavItem(
                  Icons.monetization_on,
                  'Transactions',
                  Theme.of(context).accentColor,
                  () => _goToTransactionsScreen(context),
                ),
                SizedBox(width: 5),
                CardNavItem(
                  Icons.people,
                  'Contacts',
                  Theme.of(context).primaryColor,
                  () => _goToContactsScreen(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _goToContactsScreen(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactsList()));
  }

  Future _goToTransactionsScreen(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TransactionsList()));
  }
}

import 'package:bytebank/components/container.dart';
import 'package:bytebank/models/name.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit('Higor'),
      child: DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = context.select((NameCubit name) => name.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            child: Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _FeatureItem(
                    'Transfer',
                    Icons.monetization_on,
                    onClick: () => _showContactsList(context),
                  ),
                  _FeatureItem(
                    'Transaction Feed',
                    Icons.description,
                    onClick: () => _showTransactionsList(context),
                  ),
                  _FeatureItem(
                    'Change name',
                    Icons.person_outline,
                    onClick: () => _showChangeName(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showContactsList(BuildContext context) {
    push(context, ContactsListContainer());
  }

  void _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }

  void _showChangeName(BuildContext blocContext) {
    Navigator.of(blocContext).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<NameCubit>(blocContext),
          child: NameContainer(),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(
    this.name,
    this.icon, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
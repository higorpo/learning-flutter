import 'package:flutter/material.dart';

class LoadingItems extends StatelessWidget {
  const LoadingItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Carregando...'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bytebank/models/transferencia.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencias = List();

  List<Transferencia> get transferencias => _transferencias;

  adiciona(Transferencia transferencia) {
    _transferencias.add(transferencia);
    notifyListeners();
  }
}

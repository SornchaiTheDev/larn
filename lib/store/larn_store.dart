import 'package:flutter/material.dart';
import 'package:larn/models/larn.dart';

class LarnStore with ChangeNotifier {
  final List<Larn> _larnList = [];

  List<Larn> get larnList => _larnList;

  void addLarn(Larn larn) {
    larnList.add(larn);
    notifyListeners();
  }

  void removeLarn(String id) {
    larnList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  bool isExist(String id) {
    return larnList.any((element) => element.id == id);
  }
}

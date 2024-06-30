import 'package:flutter/material.dart';
import 'package:larn/models/larn.dart';
import 'package:larn/services/db_service.dart';

class LarnStore with ChangeNotifier {
  final List<Larn> _larnList = [];

  List<Larn> get larnList => _larnList;

  LarnStore() {
    getPersistLarns();
  }

  void getPersistLarns() async {
    List<Map<String, Object?>>? larns = await db?.query("larns");

    if (larns == null) {
      return;
    }

    larns
        .map((larn) => {
              'id': larn['id'],
              'name': larn['name'],
              'description': larn['description'],
              'image_url': larn['image'],
            })
        .map((larn) => Larn.fromJson(larn))
        .toList()
        .forEach((larn) {
      larnList.add(larn);
    });
    notifyListeners();
  }

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

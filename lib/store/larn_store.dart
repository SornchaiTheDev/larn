import 'package:flutter/material.dart';
import 'package:larn/models/larn.dart';

class LarnStore with ChangeNotifier {
  final List<Larn> _larnList = [
    Larn(
      id: "667d55ba1d8bfd5076e21651",
      name: "หลานทั่วไป",
      description: "หลานที่จะช่วยมอบข้อมูลข่าวสารที่น่าเชื่อถือ และย่อยง่าย",
      image: "assets/images/larn1.png",
    ),
  ];

  List<Larn> get larnList => _larnList;

  void addLarn(Larn larn) {
    larnList.add(larn);
    notifyListeners();
  }

  void removeLarn(String id) {
    larnList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

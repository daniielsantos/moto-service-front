import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moto_services/data/dummy_bikes.dart';
import 'package:moto_services/models/bike.dart';

class Bikes with ChangeNotifier {
  final Map<String, Bike> _items = {...DUMMY_BIKES};

  List<Bike> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Bike byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Bike bike) {
    if (bike.id != "" &&
        bike.id.trim().isNotEmpty &&
        _items.containsKey(bike.id)) {        
      _items.update(bike.id, (value) => bike);
    } else {
      final id = Random().nextDouble().toString();
      
      _items.putIfAbsent(
        id,
        () => Bike(
          id: id,
          name: bike.name,
          model: bike.model,
          brand: bike.brand,
          year: bike.year,
          tumbnailUrl: "",
        ),
      );
    }
    notifyListeners();
  }

  void remove(Bike bike) {
    if (bike.id != "") {
      _items.remove(bike.id);
      notifyListeners();
    }
  }
}

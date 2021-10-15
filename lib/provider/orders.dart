import 'package:flutter/material.dart';
import 'package:moto_services/data/dummy_orders.dart';
import 'package:moto_services/models/order.dart';

class Orders with ChangeNotifier {
  final Map<String, Order> _items = {...DUMMY_ORDERS};

  List<Order> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Order byIndex(int i) {
    return _items.values.elementAt(i);
  }

}

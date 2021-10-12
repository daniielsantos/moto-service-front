
import 'package:flutter/material.dart';
import 'package:moto_services/data/dummy_partners.dart';
import 'package:moto_services/models/partner.dart';

class Partners with ChangeNotifier {
  final Map<String, Partner> _items = {...DUMMY_PARTNERS};

  List<Partner> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Partner byIndex(int i) {
    return _items.values.elementAt(i);
  }
}




import 'package:flutter/material.dart';
import 'package:moto_services/views/bike_form.dart';
import 'package:moto_services/views/bike_list.dart';
import 'package:moto_services/views/order_list.dart';
import 'package:moto_services/views/partner_list.dart';

class MainScreen extends StatefulWidget {
  int index;
  MainScreen({this.index = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = <Widget>[
    PartnerList(),
    BikeList(),
    OrderList()
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.index = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[widget.index],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_wheeler),
            label: "Motos"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Ordens"
          ),
        ],
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:moto_services/provider/bikes.dart';
import 'package:moto_services/provider/orders.dart';
import 'package:moto_services/views/bike_list.dart';
import 'package:moto_services/views/order_list.dart';
import 'package:moto_services/views/partner_list.dart';
import 'package:provider/provider.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _BottomBar();
}

class _BottomBar extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    PartnerList(),
    BikeList(),
    OrderList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Bikes(),
        ),
      ],
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.two_wheeler),
              label: 'Motos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Ordens',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

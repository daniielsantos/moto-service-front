import 'package:flutter/material.dart';
import 'package:moto_services/main/main_screens.dart';
import 'package:moto_services/provider/bikes.dart';
import 'package:moto_services/provider/orders.dart';
import 'package:moto_services/provider/partners.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Partners(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Bikes(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Moto Services',
        home: MainScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moto_services/main/main_screens.dart';
import 'package:moto_services/provider/bikes.dart';
import 'package:moto_services/provider/partners.dart';
import 'package:moto_services/routes/app_routes.dart';
import 'package:moto_services/views/bike_form.dart';
import 'package:moto_services/views/bike_list.dart';
import 'package:moto_services/views/bottom_bar.dart';
import 'package:moto_services/views/partner_list.dart';
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
        )
      ],
      child: MaterialApp(
        title: 'Moto Services',
        home: MainScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // routes: {
        //   AppRoutes.HOME: (_) => PartnerList(),
        //   AppRoutes.BIKE_FORM: (_) => BikeForm(),
        //   AppRoutes.USER_BIKES: (_) => BikeList()
        // },
      ),
    );
  }
}

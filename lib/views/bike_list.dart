import 'package:flutter/material.dart';
import 'package:moto_services/components/bike_tile.dart';
import 'package:moto_services/provider/bikes.dart';
import 'package:moto_services/routes/app_routes.dart';
import 'package:provider/provider.dart';

class BikeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bikes bikes = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Motos"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.BIKE_FORM,
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: bikes.count,
        itemBuilder: (ctx, i) => BikeTile(bikes.byIndex(i)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moto_services/components/bike_tile.dart';
import 'package:moto_services/provider/bikes.dart';
import 'package:moto_services/views/bike_form.dart';
import 'package:provider/provider.dart';

class BikeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bikes bikes = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas Motos"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BikeForm(),
                settings: const RouteSettings(arguments: null)
              ),
            ),
            icon: const Icon(Icons.add),
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

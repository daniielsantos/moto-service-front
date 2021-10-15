import 'package:flutter/material.dart';
import 'package:moto_services/components/order_tile.dart';
import 'package:moto_services/provider/orders.dart';

import 'package:provider/provider.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Pedidos"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: orders.count,
        itemBuilder: (ctx, i) => OrderTile(orders.byIndex(i)),
      ),
    );
  }
}

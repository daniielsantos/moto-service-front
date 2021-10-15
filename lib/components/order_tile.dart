import 'package:flutter/material.dart';
import 'package:moto_services/models/order.dart';
import 'package:intl/intl.dart';
class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile(this.order);

  @override
  Widget build(BuildContext context) {
    final avatar = order.tumbnailUrl == null || order.tumbnailUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.linear_scale))
        : CircleAvatar(backgroundImage: NetworkImage(order.tumbnailUrl));

    return ListTile(
      leading: avatar,
      title: Text(order.description),
      subtitle: Row(
        children: [Text("R\$ "), Text(order.price.toString())],
      ),      
      trailing: Container(
        width: 50,
        child: Row(
          children: <Widget>[
            IconButton(
              alignment: Alignment.topRight,

              onPressed: () {},
              color: Colors.grey,
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}

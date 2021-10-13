import 'package:flutter/material.dart';
import 'package:moto_services/models/bike.dart';
import 'package:moto_services/provider/bikes.dart';
import 'package:moto_services/routes/app_routes.dart';
import 'package:moto_services/views/bike_form.dart';
import 'package:provider/provider.dart';

class BikeTile extends StatelessWidget {
  final Bike bike;

  const BikeTile(this.bike);

  @override
  Widget build(BuildContext context) {
    final avatar = bike.tumbnailUrl == null || bike.tumbnailUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.two_wheeler))
        : CircleAvatar(backgroundImage: NetworkImage(bike.tumbnailUrl));

    return ListTile(
      leading: avatar,
      title: Text(bike.name),
      subtitle: Text(bike.model),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {  
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BikeForm(),
                    settings: RouteSettings(arguments: bike),
                  ),
                );
              },
              color: Colors.black,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Excluir Usuário"),
                    content: Text("Tem certeza ?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Não"),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<Bikes>(context, listen: false)
                              .remove(bike);
                          Navigator.of(context).pop();
                        },
                        child: Text("Sim"),
                      )
                    ],
                  ),
                );
              },
              color: Colors.grey,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}

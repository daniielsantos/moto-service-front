import 'package:flutter/material.dart';
import 'package:moto_services/components/partner_card.dart';
import 'package:moto_services/provider/partners.dart';
import 'package:provider/provider.dart';

class PartnerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Partners partners = Provider.of(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: partners.count,
        itemBuilder: (ctx, i) => PartnerCard(partners.byIndex(i)),
      ),
    );
  }
}

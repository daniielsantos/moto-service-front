import 'package:flutter/material.dart';
import 'package:moto_services/models/partner.dart';

class PartnerCard extends StatelessWidget {
  final Partner partner;

  const PartnerCard(this.partner);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5!.copyWith(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);
    final descriptionStyle =
        theme.textTheme.subtitle1!.copyWith(color: Colors.black54);
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 184,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Ink.image(
                      image: NetworkImage(
                        partner.tumbnailUrl,
                      ),
                      fit: BoxFit.cover,
                      // child: const Text("teste"),
                    ),
                  ),
                  const Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      // child: Text(
                      //   partner.name,
                      //   style: titleStyle,
                      // ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: DefaultTextStyle(
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: descriptionStyle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        partner.name,
                        style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        partner.description,
                        style: descriptionStyle.copyWith(color: Colors.black54),
                      ),
                    ),
                    // Text(partner.description),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

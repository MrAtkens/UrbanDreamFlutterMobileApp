import 'package:flutter/material.dart';

import 'package:urbandreamuser/models/MapPin.dart';


class ProductDescription extends StatelessWidget {
  const ProductDescription({
    required this.mapPin,
    required this.pressOnSeeMore,
  });

  final MapPin mapPin;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Text(
            mapPin.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Text("${DateTime.parse(mapPin.creationDate).toString()}",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            mapPin.description,
            maxLines: 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: getTextWidgets()
            ),
          ),
      ],
    );
  }

  Widget getTextWidgets()
  {
    List<Widget> list = [];
    mapPin.tags.forEach((element) => list.add(
        new Padding(padding: const EdgeInsets.only(right: 5, top: 5),
          child: new Text(
            "#${element.title} ",
            style: new TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
          )
        )
      )
    );
    return new Row(children: list);
  }
}

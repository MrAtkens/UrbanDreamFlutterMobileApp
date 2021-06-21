import 'package:flutter/material.dart';
import 'package:urbandreamuser/models/MapPin.dart';


import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final MapPin mapPin;

  const Body({required this.mapPin});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(mapPin: mapPin),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                mapPin: mapPin,
                pressOnSeeMore: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

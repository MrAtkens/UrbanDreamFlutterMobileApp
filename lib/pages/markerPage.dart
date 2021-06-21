import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbandreamuser/components/details/components/body.dart';
import 'package:urbandreamuser/components/details/components/custom_app_bar.dart';
import 'package:urbandreamuser/stores/mapStore.dart';



class MarkerPage extends StatefulWidget {
  @override
  MarkerPageState createState() => MarkerPageState();
}

class MarkerPageState extends State<MarkerPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapStore = context.read<MapStore>();

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: mapStore.selectedMapPin.raiting, viewCount: mapStore.selectedMapPin.countOfWatchings),
      body: Body(mapPin: mapStore.selectedMapPin),
    );
  }


}


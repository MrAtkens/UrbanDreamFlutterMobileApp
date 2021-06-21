import 'package:flutter/material.dart';
import 'package:urbandreamuser/components/forms/menuDrawer.dart';
import 'package:urbandreamuser/stores/authStore.dart';

import '../components/map.dart';
import '../components/searchBottom.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MenuDrawer(key: new Key("Menu")),
      body: Stack(
        children: <Widget>[
          MapPins(),
          SearchBottom()
        ],
      ),
    );
  }



}


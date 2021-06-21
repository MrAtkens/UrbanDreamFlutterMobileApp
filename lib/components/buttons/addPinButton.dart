import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AddPinButton extends StatelessWidget {
  const AddPinButton({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => openContainer(),
        child: Icon(FontAwesomeIcons.mapMarker,color:Colors.white, size: 20),
      );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MenuButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () => Scaffold.of(context).openEndDrawer(),
        child: Icon(FontAwesomeIcons.bars,color:Colors.grey, size: 25),
      )
  );
}
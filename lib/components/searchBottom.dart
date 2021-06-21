import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animations/animations.dart';

import 'buttons/addPinButton.dart';
import 'forms/addPinForm.dart';
import 'buttons/menuButton.dart';

class SearchBottom extends StatelessWidget {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child:  Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [  BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 4,
              )],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Flexible(flex:8, child: inputContainer(context)),
                  Flexible(flex:2, child: MenuButton())
                ],
              )
            ],
          )
      ),
    );
  }

  Widget inputContainer(BuildContext context){
    return(Container(
      height: 30,
      margin: const EdgeInsets.only(left: 2),
      width: (MediaQuery.of(context).size.width * 80) / 100,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [Flexible(flex: 1,child: Container(margin: const EdgeInsets.only(left: 10),
          child: Icon(FontAwesomeIcons.search,color:Colors.grey, size: 15),)),
          Flexible(flex: 5, child: searchField())]
      ),
    )
    );
  }

  Widget searchField(){
    return(Container(
      child:   TextField(
        controller: _searchController,
        cursorColor: Colors.orange,
        autofocus: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 5, bottom: 13),
            hintText: 'Searching...'
        ),
      ),
    ));
  }

  Future<void> open() async {

  }

  Future<void> add() async {

  }
}
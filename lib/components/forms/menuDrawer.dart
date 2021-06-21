import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:urbandreamuser/stores/authStore.dart';
import 'package:urbandreamuser/stores/mapStore.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({required Key key}) : super(key: key);

  @override
  MenuDrawerState createState() => MenuDrawerState();
}

class MenuDrawerState extends State<MenuDrawer> {

  @override
  Widget build(BuildContext context) {
    final authStore = context.read<AuthStore>();

    Widget _createHeader() {
      return DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:  AssetImage('assets/images/NavigationBackground.jpg'))),
          child: Stack(children: <Widget>[
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Observer(
                    builder: (_) => Column(
                      children: [
                        Text(authStore.isAuthenticated == true ? "${authStore.user.lastName} ${authStore.user.firstName}" : "You are not logged in",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(authStore.isAuthenticated == true ?
                        "${authStore.user.email}" : "",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,))
                      ],
                    )
                )
            )]
          )
      );
    }

    Widget _createDrawerItem(
        {required IconData icon, required String text, required GestureTapCallback onTap}) {
      return ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(text),
            )
          ],
        ),
        onTap: onTap,
      );
    }

    return new Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.6,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createHeader(),
              Conditional.single(
                conditionBuilder: (BuildContext context) => authStore.isAuthenticated == true,
                widgetBuilder: (BuildContext context) => Container(),
                fallbackBuilder: (BuildContext context) => _createDrawerItem(icon: Icons.login,
                    text: 'Sing In & Sing Up',
                    onTap: () => Navigator.pushNamed(context, '/login')),
                context: context,
              ),
              _createDrawerItem(icon: Icons.map,
                  text: 'Map',
                  onTap: () => Navigator.pushNamed(context, '/')),
              _createDrawerItem(icon: Icons.link_sharp,
                  text: 'Useful Links',
                  onTap: () => Navigator.pushNamed(context, '/')),
              Conditional.single(
                conditionBuilder: (BuildContext context) => authStore.isAuthenticated == true,
                widgetBuilder: (BuildContext context) => _createDrawerItem(icon: Icons.verified_user, text: 'Your Identifier',
                    onTap: () => Clipboard.setData(ClipboardData(text: authStore.user.id))),
                fallbackBuilder: (BuildContext context) => Container(),
                context: context,
              ),
              Divider(),
              Conditional.single(
                conditionBuilder: (BuildContext context) => authStore.isAuthenticated == true,
                widgetBuilder: (BuildContext context) => _createDrawerItem(icon: Icons.logout, text: 'Logout',
                    onTap: () => authStore.logOut(context)),
                fallbackBuilder: (BuildContext context) => Container(),
                context: context,
              ),
              ListTile(
                title: Text('0.0.1'),
                onTap: () {},
              ),
            ],
          ),
        )
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:urbandreamuser/pages/markerPage.dart';
import 'package:urbandreamuser/pages/registration.dart';
import 'package:urbandreamuser/stores/authStore.dart';
import 'package:urbandreamuser/stores/mapStore.dart';

import 'pages/homepage.dart';
import 'pages/login.dart';

void main() {
  runApp(MultiProvider(
        providers: [
          ListenableProvider<AuthStore>(create: (_) => AuthStore()),
          ListenableProvider<MapStore>(create: (_) => MapStore())
        ],
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final authStore = context.read<AuthStore>();
    Future<void> initAuthStore(context) async {
      authStore.setInitialRoute(context);
    }

    initAuthStore(context);
    return Observer(builder: (context) {
        return MaterialApp(
          title: 'UrbanDream',
          initialRoute: '/',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (_) => HomePage(),
            '/marker': (_) => MarkerPage(),
            '/login': (_) => LoginPage(),
            '/registration': (_) => RegistrationPage(),
          }
       );
      }
    );
  }

}

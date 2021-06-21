import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:urbandreamuser/models/User.dart';

part 'authStore.g.dart';

class AuthStore = AuthBase with _$AuthStore;

const url = "https://urban-user.gibkii-kamen.kz";
const _storage = FlutterSecureStorage();
//flutter packages pub run build_runner build
abstract class AuthBase with Store, ChangeNotifier {
  @observable
  User user = User.empty();
  @observable
  bool isAuthenticated = false;

  @action
  Future<void> authorization(context, String email, String password) async {
    var dio = Dio();
    final response = await dio.post('$url/api/auth/SignIn', data: {'phoneNumber': email, 'password': password});
    await _storage.write(key: "jwt_token", value: response.data);
    if(response.statusCode == 200){
      await setInitialRoute(context);
    }
    else if(response.statusCode == 500){
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: new Text("Ошибка"),
            content: new Text("На данный момент на сервере нашего сервиса произошла ошибка,"
                "пожалуйста попробуйте позже"),
            actions: <Widget>[
              FlatButton(
                child: Text('Закрыть'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }
    else{
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: new Text("Ошибка"),
            content: new Text("Неверно введена почта или пароль"),
            actions: <Widget>[
              FlatButton(
                child: Text('Закрыть'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }
  }

  @action
  Future<void> registration(context, String firstName, String lastName, String email, String password) async {
    var dio = Dio();
    final response = await dio.post('$url/api/auth/SignUp', data: {
      'firstName': firstName, 'lastName': lastName,
      'email': email, 'password': password});
    _storage.write(key: "jwt_token", value: response.data);
    if(response.statusCode == 200){
      await setInitialRoute(context);
    }
    else if(response.statusCode == 500){
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: new Text("Ошибка"),
            content: new Text("На данный момент на сервере нашего сервиса произошла ошибка,"
                "пожалуйста попробуйте позже"),
            actions: <Widget>[
              FlatButton(
                child: Text('Закрыть'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }
    else{
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: new Text("Ошибка"),
            content: new Text("Неверно введена почта или пароль"),
            actions: <Widget>[
              FlatButton(
                child: Text('Закрыть'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }
  }

  @action
  Future<void> logOut(context) async {
    _storage.delete(key: "jwt_token");
    isAuthenticated = false;
    user = User.empty();
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Вы успешно вышли из системы"),
        ));
  }

  @action
  Future<void> setInitialRoute(context) async {
    const _storage = FlutterSecureStorage();
    var token = await _storage.read(key: "jwt_token");
    if(token != null){
      var dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final responseGetData = await dio.get('$url/api/account');
      if(responseGetData.statusCode == 200) {
        user = User.fromMap(responseGetData.data);
        isAuthenticated = true;
        Navigator.pushNamed(context, '/');
      }
    }
  }


  @computed
  User get getUser => user;
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:urbandreamuser/models/MapPin.dart';

part 'mapStore.g.dart';

class MapStore = MapBase with _$MapStore;

const _storage = FlutterSecureStorage();
const url = "https://urban-user.gibkii-kamen.kz";
//flutter packages pub run build_runner build
abstract class MapBase with Store, ChangeNotifier {
  @observable
  ObservableList<MapPin> mapMarkers = ObservableList<MapPin>();
  @observable
  int markersCount = 0;
  @observable
  String mapPinId = "";
  @observable
  MapPin selectedMapPin = MapPin.empty();
  @observable
  double userLat = 0;
  @observable
  double userLon = 0;
  @observable
  ObservableList<String> images = ObservableList<String>();

  @action
  Future<List<MapPin>> fetchMapMarkers() async {
    List<MapPin> mapPins = [];
    var dio = Dio();
    final response = await dio.get('${url}/api/pin/accepted');
    print(response.data);
    response.data.forEach((data) {
      MapPin mapPin = MapPin.fromJson(data);
      mapPins.add(mapPin);
      mapMarkers.add(mapPin);
    });
    markersCount = mapMarkers.length;
    return mapPins;
  }

  @action
  Future<void> addPin({required String title, required String description,
  required String userId, required List<String> tags}) async{
    var dioGet = Dio();
    var token = _storage.read(key: "jwt_token");
    dioGet.options.headers["Authorization"] = "Bearer $token";
    var params =  {
      "title": title,
      "description": description,
      "longitude": userLon,
      "latitude": userLat,
      "userId": userId,
      "tags": [tags.forEach((element) => "$element")],
      "images": [images.forEach((element) => "$element")],
    };
    final responseGetData = await dioGet.post('$url/api/pin', data: jsonEncode(params));
    print(responseGetData);
  }



  @computed
  List<MapPin> get getMap => mapMarkers;
}
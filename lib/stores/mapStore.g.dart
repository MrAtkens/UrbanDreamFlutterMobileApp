// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on MapBase, Store {
  Computed<List<MapPin>>? _$getMapComputed;

  @override
  List<MapPin> get getMap => (_$getMapComputed ??=
          Computed<List<MapPin>>(() => super.getMap, name: 'MapBase.getMap'))
      .value;

  final _$mapMarkersAtom = Atom(name: 'MapBase.mapMarkers');

  @override
  ObservableList<MapPin> get mapMarkers {
    _$mapMarkersAtom.reportRead();
    return super.mapMarkers;
  }

  @override
  set mapMarkers(ObservableList<MapPin> value) {
    _$mapMarkersAtom.reportWrite(value, super.mapMarkers, () {
      super.mapMarkers = value;
    });
  }

  final _$markersCountAtom = Atom(name: 'MapBase.markersCount');

  @override
  int get markersCount {
    _$markersCountAtom.reportRead();
    return super.markersCount;
  }

  @override
  set markersCount(int value) {
    _$markersCountAtom.reportWrite(value, super.markersCount, () {
      super.markersCount = value;
    });
  }

  final _$fetchMapMarkersAsyncAction = AsyncAction('MapBase.fetchMapMarkers');

  @override
  Future<List<MapPin>> fetchMapMarkers() {
    return _$fetchMapMarkersAsyncAction.run(() => super.fetchMapMarkers());
  }

  @override
  String toString() {
    return '''
mapMarkers: ${mapMarkers},
markersCount: ${markersCount},
getMap: ${getMap}
    ''';
  }
}

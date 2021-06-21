import 'dart:async';

import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:animations/animations.dart';
import 'package:provider/provider.dart';

import 'package:urbandreamuser/helpers/mapHelper.dart';
import 'package:urbandreamuser/helpers/mapMarker.dart';
import 'package:urbandreamuser/models/MapPin.dart';
import 'package:urbandreamuser/stores/mapStore.dart';

import 'buttons/addPinButton.dart';
import 'forms/addPinForm.dart';

class MapPins extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPins> {
  final Completer<GoogleMapController> _mapController = Completer();

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = Set();

  /// Minimum zoom at which the markers will cluster
  final int _minClusterZoom = 0;

  /// Maximum zoom at which the markers will cluster
  final int _maxClusterZoom = 19;

  /// [Fluster] instance used to manage the clusters
  Fluster<MapMarker>? _clusterManager;

  /// Current map zoom. Initial zoom will be 15, street level
  double _currentZoom = 15;

  /// Map loading flag-------[[[[[[[[[[[[[[[[[[[[[[[[[;l
  bool _isMapLoading = true;

  /// Markers loading flag
  bool _areMarkersLoading = true;

  /// Url image used on normal markers
  final String _markerImageUrl =
      'https://historyblogkazakhstan.s3.ap-northeast-2.amazonaws.com/Images/Worked%2BCity%2BMaps.png';

  /// Color of the cluster circle
  final Color _clusterColor = Colors.blue;

  /// Color of the cluster text
  final Color _clusterTextColor = Colors.white;

  Location _location = Location();

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.


  /// Inits [Fluster] and all the markers with network images and updates the loading state.

  @override
  Widget build(BuildContext context) {
    final mapStore = context.read<MapStore>();

    /// Gets the markers and clusters to be displayed on the map for the current zoom level and
    /// updates state.
    Future<void> _updateMarkers([double? updatedZoom]) async {
      if (_clusterManager == null || updatedZoom == _currentZoom) return;

      if (updatedZoom != null) {
        _currentZoom = updatedZoom;
      }

      setState(() {
        _areMarkersLoading = true;
      });

      final updatedMarkers = await MapHelper.getClusterMarkers(
        _clusterManager,
        _currentZoom,
        _clusterColor,
        _clusterTextColor,
        80,
      );

      _markers
        ..clear()
        ..addAll(updatedMarkers);

      setState(() {
        _areMarkersLoading = false;
      });
    }


    void openMarker(MapPin selectedMapPin) async {
      mapStore.selectedMapPin = selectedMapPin;
      Future<LocationData> locationData = _location.getLocation();
      locationData.then((value) => {
        mapStore.userLat = value.latitude!,
        mapStore.userLon = value.longitude!
      });
      await Navigator.pushNamed(context, '/marker');
    }

    void _initMarkers() async {
      final List<MapMarker> markers = [];
      List<MapPin> mapPins = [];

      mapPins = await mapStore.fetchMapMarkers();
      for (MapPin markerLocation in mapPins) {
        final BitmapDescriptor markerImage =
        await MapHelper.getMarkerImageFromUrl(_markerImageUrl);

        markers.add(
          MapMarker(
            id: markerLocation.id,
            position: new LatLng(markerLocation.latitude, markerLocation.longitude),
            icon: markerImage,
            onTap: (){
              openMarker(markerLocation);
            }
          ),
        );
        _clusterManager = await MapHelper.initClusterManager(
          markers,
          _minClusterZoom,
          _maxClusterZoom,
            (){
              mapStore.selectedMapPin = markerLocation;
              Future<LocationData> locationData = _location.getLocation();
              locationData.then((value) => {
                mapStore.userLat = value.latitude!,
                mapStore.userLon = value.longitude!
              });
              Navigator.pushNamed(context, '/marker');
            }
        );
      }


      await _updateMarkers();
    }

    void _onMapCreated(GoogleMapController controller) {
      _mapController.complete(controller);

      setState(() {
        _isMapLoading = false;
      });

      _initMarkers();
    }

    Widget _map(){
      return(
          Opacity(
            opacity: _isMapLoading ? 0 : 1,
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(51.13111451286475, 71.4126380879402),
                zoom: _currentZoom,
              ),
              markers: _markers,
              onMapCreated: (controller) => _onMapCreated(controller),
              onCameraMove: (position) => _updateMarkers(position.zoom),
            ),
          )
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _map(),
          // Map loading indicator
          Opacity(
            opacity: _isMapLoading ? 1 : 0,
            child: Center(child: CircularProgressIndicator()),
          ),
          _zoomPlus(),
          _zoomMinus(),
          _findMe(),
          _addPin()
        ],
      ),
    );
  }


  Widget _zoomPlus() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          margin: const EdgeInsets.only(bottom: 90),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            mini: true,
            onPressed: () {
              _plus();
            },
            child: Icon(FontAwesomeIcons.plus,color:Colors.grey, size: 20),
          )
      ),
    );
  }

  Widget _zoomMinus() {
    return Align(
        alignment: Alignment.centerRight,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          mini: true,
          onPressed: () {
          _minus();
        },
          child: Icon(FontAwesomeIcons.minus,color:Colors.grey, size: 20),)
    );
  }

  Widget _findMe() {

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          margin: const EdgeInsets.only(top: 90),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            mini: true,
            onPressed: () {
              _myLocation(_currentZoom);
            },
            child: Icon(FontAwesomeIcons.locationArrow, color:Colors.grey, size: 15),)
      )
      );
  }

  Widget _addPin(){
    return(
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                margin: const EdgeInsets.only(bottom: 70, right: 5),
                child: OpenContainer(
                  transitionDuration: Duration(seconds: 1),
                  closedShape: CircleBorder(),
                  closedColor: Colors.orange,
                  tappable: true,
                  openBuilder: (_, closeContainer) => AddPinForm(closeContainer),
                  closedBuilder: (_, openContainer) => AddPinButton(openContainer: openContainer),
            ))
        )
    );
  }

  Future<void> _minus() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.zoomOut());
  }
  Future<void> _plus() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.zoomIn());
  }

  Future<void> _myLocation(double zoomVal) async {
    final GoogleMapController controller = await _mapController.future;
    Future<LocationData> locationData = _location.getLocation();
    locationData.then((value) =>
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(value.latitude!.toDouble(), value.longitude!.toDouble()), zoom: zoomVal),
          ),
        )
    );
  }
}
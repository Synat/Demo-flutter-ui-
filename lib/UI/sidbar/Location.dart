import 'dart:async' as prefix0;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  @override
  _Location createState() => _Location();
}

class _Location extends State<Location> {
  static const LatLng _center = const LatLng(11.568346, 104.891531);
  var _currentMapType = MapType.terrain;
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  var _controller = new prefix0.Completer();
  BitmapDescriptor myIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Location"),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 16.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.yellow.shade800,
                  child: const Icon(Icons.map, size: 36.0),
                ),
              ),
            ),
          ],
        ));
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.terrain
          ? MapType.satellite
          : MapType.terrain;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          // infoWindow: InfoWindow(
          //   title: 'Really cool place',
          //   snippet: '5 Star Rating',
          // ),
          icon: BitmapDescriptor.fromAsset("assets/images/pin.png"),
          onTap: () => {_settingModalBottomSheet(context)}));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _onAddMarkerButtonPressed();
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.4,
            child: Center(
                child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/backg.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width - 32,
                            child: ClipOval(
                                child: Image.asset(
                              'assets/images/pin1.png',
                              fit: BoxFit.contain,
                              matchTextDirection: true,
                              height: 130,
                            ))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text("Company Food KH",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("We provide the best service",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 15)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("food in Cambodia.",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 15)),
                      )
                    ],
                  ),
                )
              ],
            )),
          );
        });
  }
}

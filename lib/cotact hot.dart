import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  LocationData _currentPosition;
  String _address, _dateTime;
  GoogleMapController mapController;
  Marker marker;
  CameraPosition camera;
  Location location = Location();
  Position userLocation;
  GoogleMapController _controller;
  LatLng _initialcameraposition = LatLng(7.890405, 98.390166);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Container(
            color: Colors.blueGrey.withOpacity(.8),
            child: Center(
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: _initialcameraposition, zoom: 15),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      myLocationEnabled: true,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_dateTime != null)
                    Text(
                      "Date/Time: $_dateTime",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("คลินิกอุ่นใจ"),
                      subtitle: Text("โทร:076254200"),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("สถานีอนามัยศรีสุนทร"),
                      subtitle: Text("โทร:076311618"),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("สถานีอนามัยตำบลกะทู้"),
                      subtitle: Text("โทร:076321548"),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("โรงพยาบาลป่าตอง"),
                      subtitle: Text("โทร:076342633"),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("โรงพยาบาลส่งเสริมสุขภาพตำบลตำบลตำบลกมลา"),
                      subtitle: Text("โทร:076385136"),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("สถานีอนามัยแหลมชัน"),
                      subtitle: Text("โทร:076221829"),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text(
                          "โรงพยาบาลส่งเสริมสุขภาพตำบลตำบลเฉลิมพระเกียรติ 60 พรรษา นวมินทราชินี"),
                      subtitle: Text("โทร:076381638"),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("โรงพยาบาลวชิระภูเก็ต"),
                      subtitle: Text("โทร:076361234"),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("โรงพยาบาลฉลอง"),
                      subtitle: Text("โทร:076384342"),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[800],
                        child: FittedBox(
                          child: Text("ภูเก็ต"),
                        ),
                      ),
                      title: Text("โรงพยาบาล อบจ"),
                      subtitle: Text("โทร:076358888"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialcameraposition =
        LatLng(_currentPosition.latitude, _currentPosition.longitude);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition =
            LatLng(_currentPosition.latitude, _currentPosition.longitude);

        DateTime now = DateTime.now();
        _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);
        _getAddress(_currentPosition.latitude, _currentPosition.longitude)
            .then((value) {
          setState(() {
            _address = "${value.first.addressLine}";
          });
        });
      });
    });
  }

  Future<List<Address>> _getAddress(double lat, double lang) async {
    final coordinates = new Coordinates(lat, lang);
    List<Address> add =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }
}

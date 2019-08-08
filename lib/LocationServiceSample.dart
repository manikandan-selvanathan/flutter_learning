//https://medium.com/swlh/working-with-geolocation-and-geocoding-in-flutter-and-integration-with-maps-16fb0bc35ede

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationServiceSample extends StatefulWidget {
  @override
  _LocationServiceSampleState createState() => _LocationServiceSampleState();
}

class _LocationServiceSampleState extends State<LocationServiceSample> {
  var _locaiton = new Location();
  String _currentLocation = "Location yet to be fetched";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Get Location Sample")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  getLocation().then((onValue) {
                    setState(() {
                      _currentLocation = onValue;
                    });
                  });
                },
                child: Text("Get Location")),
            Text(_currentLocation, style: TextStyle(fontSize: 15))
          ],
        )));
  }

  Future<String> getLocation() async {
    try {
      var location2 = await _locaiton.getLocation();
      var locationstring = location2.latitude.toString() +"  "+ location2.longitude.toString();
      var result = "Location: $locationstring";

      // _locaiton.onLocationChanged().listen((LocationData currentLocation) {
      //   print(currentLocation.latitude);
      //   print(currentLocation.longitude);
      // });

      return result;
    } catch (e) {
      return null;
    }
  }
}

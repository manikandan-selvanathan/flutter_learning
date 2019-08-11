import 'package:flutter/material.dart';
import 'package:location/location.dart';

class FlutterTrainingHelper
{

  Future<LocationData> getLocation() async {
    try {
       var _locaitonApi = new Location();
       var location = await _locaitonApi.getLocation();
      _locaitonApi.onLocationChanged().listen((LocationData currentLocation) {
        
      }); 
      return location;
    } catch (e) {
      return null;
    }
  }

}
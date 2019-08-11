import 'package:flutter/material.dart';
import 'package:flutter_training/helper/FlutterTrainingHelper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsSamplePage extends StatefulWidget {
  @override
  _GoogleMapsSamplePageState createState() => _GoogleMapsSamplePageState();
}

class _GoogleMapsSamplePageState extends State<GoogleMapsSamplePage> {
  GoogleMapController mapController;
  CameraPosition position;
  LatLng _center; 

  @override
  void initState() 
  {
        position=new CameraPosition(
          target: new LatLng(45.521563, -122.677433),
          zoom: 11.0
        );
      
      FlutterTrainingHelper flutterTrainingHelper=new FlutterTrainingHelper();
      flutterTrainingHelper.getLocation().then((loc)
      {
        setState(() 
        {
             position=new CameraPosition(
              target: new LatLng(loc.latitude, loc.longitude),
              zoom: 15.0
            );  
        });
      });
      super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    return GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: position,
        );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_training/networkCalls/model/SampleModel.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:connectivity/connectivity.dart';

class FlutterTrainingHelper {
  Future<LocationData> getLocation() async {
    try {
      var _locaitonApi = new Location();
      var location = await _locaitonApi.getLocation();
      _locaitonApi
          .onLocationChanged()
          .listen((LocationData currentLocation) {});
      return location;
    } catch (e) {
      return null;
    }
  }

  Future<String> getSayHello() async {
    var logger = new Logger();
    try {
      var response = await http.get(
          "https://flutter-training.herokuapp.com/sayHello?username=Manikandan Selvanathan");
      if (response?.statusCode == 200) {
        return response?.body;
      }
      throw new Exception("Response is null");
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<String> getJson() async {
    var logger = new Logger();
    try {
      var response = await http
          .get("https://flutter-training.herokuapp.com/getSampleJson");
      if (response?.statusCode == 200) {
        var user = User.fromJson(json.decode(response.body));
        return "Raw Json: \n" +
            response.body +
            "\n Parsed Json: \n UserName: " +
            user.userName +
            "\n Password: " +
            user.password;
      }
      throw new Exception("Response is null");
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<bool> isNetworkConnected() async {
    var logger = new Logger();
    bool isConnected = false;
    try {
      var connectivity = new Connectivity();
      var result = await connectivity.checkConnectivity();
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        isConnected = true;
      }
    } catch (e) {
      logger.e(e);
    }
    return isConnected;
  }
  
}

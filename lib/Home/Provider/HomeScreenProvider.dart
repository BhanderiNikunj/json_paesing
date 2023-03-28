import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenProvider extends ChangeNotifier{

  List ProfileList = [];

  Future<void> JsonParsing() async {
    String JsonDataString = await rootBundle.loadString("Assets/Json/profile.json");
    var Json = jsonDecode(JsonDataString);

    ProfileList = Json;
    notifyListeners();
  }
}
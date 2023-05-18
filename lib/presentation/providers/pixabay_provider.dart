import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pixabay_app/data/models/pixabay_model.dart';

//https://pixabay.com/api/?key=36433485-69a67e2af8d7258715aebeb0d
String _baseUrl = 'https://pixabay.com/api';
String _apiKey = '36433485-69a67e2af8d7258715aebeb0d';

class PixabayProvider extends ChangeNotifier {
  // final url = '$_baseUrl/?key=$_apiKey';
  List<Hit> pixabayList = [];

  // PixabayProvider() {
  //   print("LLAMANDO A PIXABAY");
  //   print(url);
  //   getPixabay();
  // }

  Future<void> getImages(String value) async {
    final url = '$_baseUrl/?key=$_apiKey&q=$value';
    final response = await http.get(Uri.parse(url));
    final resp = pixabayModelFromJson(response.body);

    if (value.isNotEmpty) {
      pixabayList.clear();
      pixabayList.addAll(resp.hits);
      notifyListeners();
    } else {
      pixabayList = [];
      notifyListeners();
    }
  }

  // getPixabay() async {
  //   final response = await http.get(Uri.parse(url));

  //   final resp = pixabayModelFromJson(response.body);
  //   pixabayList.addAll(resp.hits);
  //   notifyListeners();
  // }
}

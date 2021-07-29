import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:receipe_app/model/response_filter.dart';

class NetClient {
  String url = 'https://www.themealdb.com/api/json/v1/1/';
  late String endPoint;

  Future<ResponseFilter?> fetchDataMeals(int currentIndex) async {
    if (currentIndex == 0) {
      endPoint = 'filter.php?c=Seafood';
    } else {
      endPoint = 'filter.php?c=Dessert';
    }
    try {
      var res = await http.get(Uri.parse(url + endPoint));
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        ResponseFilter data = ResponseFilter.fromJson(json);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

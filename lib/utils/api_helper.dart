import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_api/screen/home/model/home_model.dart';

class APIHelper {
  static APIHelper helper = APIHelper._();
  APIHelper._();

  Future<HomeModel?> getData() async {
    String link =
        "https://opentdb.com/api.php?amount=10&category=21&difficulty=easy&type=multiple";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModel model = HomeModel.mapToModel(json);
      return model;
    }
    return null;
  }
}

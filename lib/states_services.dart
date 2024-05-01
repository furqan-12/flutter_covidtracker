import 'dart:convert';

import 'package:covid_tracker/model_1.dart';
import 'package:http/http.dart' as http;
import 'app_url.dart';

class StateServices {
  Future<Model> fetchWorldStatesRecords() async {
    final Response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (Response.statusCode == 200) {
      var data = jsonDecode(Response.body);
      return Model.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final Response = await http.get(Uri.parse(AppUrl.countriesList));
    if (Response.statusCode == 200) {
      data = jsonDecode(Response.body);
      return data;
    } else {
      throw Exception("error");
    }
  }
}

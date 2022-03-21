import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:application/model/stat.dart';

class StatApi {
  static Future<List<Covidstat>> getStat() async {
    var uri = Uri.https('covid-193.p.rapidapi.com', '/statistics');
    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "covid-193.p.rapidapi.com",
      "x-rapidapi-key": "08dd1c6dffmsh915abb02177a83cp1a876ejsn06b819e7c568",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['response']) {
      _temp.add(i);
    }
    return Covidstat.covidstatFromSnapshot(_temp);
  }
}

import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://vacina-app.herokuapp.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/user";
    return http.get(url);
  }
}

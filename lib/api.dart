import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://vacina-app.herokuapp.com";

class Usuarios {
  static Future getUsers() {
    var url = baseUrl + "/user";
    return http.get(url);
  }
}

class Vacinas {
  static Future getVacinas() {
    var url = baseUrl + "/vacina";
    return http.get(url);
  }
}

class Vacinados {
  static Future getVacinados() {
    var url = baseUrl + "/vacinar";
    return http.get(url);
  }
}

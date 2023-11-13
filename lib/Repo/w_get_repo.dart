import 'dart:convert';

import 'package:api_class/Model/UserModel.dart';
import 'package:http/http.dart' as http;

class GetStudentRepo {
  Future<UserModel> getStudent({required int numberOfUser}) async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=&units=metric&appid=fc59b04aa5b2df91d35db6fbf4800b7b';

    var response = await http.get(Uri.parse(url), headers: {});
    var data = jsonDecode(response.body);
    return UserModel.fromJson(data);
  }
}

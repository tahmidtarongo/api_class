import 'dart:convert';

import 'package:api_class/Model/UserModel.dart';
import 'package:http/http.dart' as http;

class GetStudentRepo {
  Future<UserModel> getStudent({required int numberOfUser}) async {
    String url = 'https://randomuser.me/api/?results=$numberOfUser';

    var response = await http.get(Uri.parse(url),headers: {});
    var data = jsonDecode(response.body);
    return UserModel.fromJson(data);
  }
}

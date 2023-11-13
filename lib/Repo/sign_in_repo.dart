import 'dart:convert';

import 'package:api_class/config.dart';
import 'package:http/http.dart' as http;

Future<bool> signInRepo({required String password, required String email}) async {
  String url = '${Config.finalUrl}/sign-in';

  var response = await http.post(Uri.parse(url), body: {
    "email": email,
    "password": password,
  });
  print(response.statusCode);
  var resData = jsonDecode(response.body);

  print(resData['data']['token']);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

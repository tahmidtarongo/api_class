import 'package:api_class/config.dart';
import 'package:http/http.dart' as http;

Future<bool> signUpRepo({required String name, required String password, required String email, required String phone}) async {
  String url = '${Config.finalUrl}/sign-up';

  var response = await http.post(Uri.parse(url), body: {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
  });
  print(response.statusCode);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

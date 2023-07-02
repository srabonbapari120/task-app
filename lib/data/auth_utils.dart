import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {

  static String? token, email,firstName, lastName, mobile, photo;

  static Future<void> saveUserData(String utoken, String ufirstName,
      String ulastName, String uphone, String uemail, String uphoto) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', utoken);
    await sharedPreferences.setString('email', uemail);
    await sharedPreferences.setString('firstName', ufirstName);
    await sharedPreferences.setString('lastName', ulastName);
    await sharedPreferences.setString('mobile', uphone);
    await sharedPreferences.setString('photo', uphoto);
  }
}

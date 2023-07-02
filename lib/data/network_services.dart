import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkServices {

  //Get Request
  Future<dynamic> getData(String URL, String? token) async {
    try {
      final http.Response response = await http.get(Uri.parse(URL),headers:{
        'Content-Type': 'application/json',
        'token' : token ?? ''
      }, );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("Unathorized");
      } else {
        print("Something went arong");
      }
    } catch (e) {
      print(e.toString());
    }
  }


  //POST Request
  Future<dynamic> postData(String URL, String? token, {Map<dynamic, dynamic>? body,}) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(URL),
        headers:{
          'Content-Type': 'application/json',
          'token' : token ?? ''
        },
        body: jsonEncode(body),);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("Unathorized");
      } else {
        print("Something went arong");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
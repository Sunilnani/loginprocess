import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_network.dart';
import 'base_response.dart';


class LoginManager {
  Future<dynamic> createLoginToken(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);
    Response response = await dioClient.tokenRef.post("/verify_otp/", data: formData,);

    if (response?.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (response.data['status']) {
        prefs.setString("token", response.data['token']);
        print(response);
        return ResponseData("", ResponseStatus.SUCCESS,
            data: response.data);

      } else {
        return ResponseData(response.data['message'], ResponseStatus.FAILED);
      }
    } else {
      return ResponseData("Failed to get data", ResponseStatus.FAILED);
    }
  }
}

final loginManager = LoginManager();

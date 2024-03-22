import 'package:dio/dio.dart';
import 'package:ema/Models/user_model.dart';
import 'package:ema/helper/API.dart';
import 'package:ema/shared/constants.dart';

class UserService {
  Dio dio = Dio();

  // final String baseUrl = 'http://192.168.1.122:8000';

  Future<UserModel> getUser() async {
    Response response =
        await API().Get(Url: '$baseUrl/api/user/', token: accessToken);
    Map<String, dynamic> jsonData = response.data;
    UserModel user = UserModel.fromjson(jsonData);
    return user;
  }
}

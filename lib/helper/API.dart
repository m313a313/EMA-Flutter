import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class API {
  Dio dio = Dio();
  Future<Response> Get({required String Url, @required String? token}) async {
    Map<String, String> headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
    };
    
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response response =
          await dio.get(Url, options: Options(headers: headers));
      print(response.statusCode);
      return response;
    } on DioException catch (e) {
      String errMsg;
      if (e.response != null)
        errMsg = 'oops there is an error ${e.response!.statusCode.toString()}';
      else
        errMsg = 'no response from server';

      throw Exception(errMsg);
    }
  }

  Future<Response> Post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      print(url);
      Response res =
          await dio.post(url, data: body, options: Options(headers: headers));
      return res;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'oops there is an erorr ${e.response!.statusCode}${e.response!.data}${e.toString()}');
      } else {
        throw Exception('No response from server');
      }
    } catch (e) {
      throw Exception('No response from server not dio expcetion');
    }
  }

  Future<Response> Put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {
      // 'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response res =
          await dio.put(url, data: body, options: Options(headers: headers));
      return res;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'oops there is an erorr ${e.response!.statusCode}${e.response!.data}');
      } else {
        throw Exception('No response from server');
      }
    } catch (e) {
      throw Exception('No response from server not dio expcetion');
    }
  }
}


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'model/user_model.dart';

class DataServices {
    final Dio _dio = Dio();
    UserModel ?user;
    String baseUrl = 'https://reqres.in/api/users?page=2';
    UserModel? list;
    Future<UserModel?> getInfo() async {
      Response response = await _dio.get(baseUrl);
      print("--->>>>>>>${response.data}");
      user =UserModel.fromJson(response.data);
      print("->------------${user!.toJson()}");
      return UserModel.fromJson(response.data);

  }
}
import 'package:dio/dio.dart';


class FoodRepository {
  Duration duration = const Duration(seconds: 5);
  Future<Response> isUserLogin(String phoneNumber, String password)async{
    Response response = await Dio().post(
      "http://khelaahobe.com/api/flutter/login",
      queryParameters: <String,dynamic>{
        "phone" : phoneNumber,
        "password": password,
      },
    ).timeout(duration);
    print(response);
    return response;
  }

  Future<Response> foodCategory()async{
    Response response = await Dio().get(
      "http://khelaahobe.com/api/auth/flutter/category",
      options: Options(
        headers: <String,dynamic>{
          "Authorization": "Bearer 7834|YBIH77jWKLh7Yds9oZ5hGkRMfPcaMHU3mqlE8stk",
        }
      )
    ).timeout(duration);
    print(response);
    return response;
  }



}


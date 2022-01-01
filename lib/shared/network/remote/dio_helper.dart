import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
  static Dio? dio;

static iniit(){
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    )
  );
}
static Future<Response> getData({
  required String url,
  required Map<String,dynamic> query,
})
  async{
  return await dio!.get(url,
      queryParameters: query);
  }
}
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static  init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> GetData({
  required String url,
    Map<String,dynamic>? query
})async{
    return await dio!.get(url,queryParameters: query);
  }
}
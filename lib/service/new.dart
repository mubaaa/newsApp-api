// import 'package:news_api/model/article.dart';

// class News{
//   List<ArticleModel>news=[];

// }

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_api/model/article.dart';

class HttpService {
  String baseUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-05-15&sortBy=publishedAt&apiKey=0cba106db9f847799d3bb5b6ba8d32c0";
  News? news;
  Article? article;
  late Dio dio;

  HttpService() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    initializeInterceptors();
  }

  Future<List<Article?>> getReg() async {
    Response response;
    try {
    
      response = await dio.get(baseUrl);
     news = News.fromJson(response.data);
      // ignore: avoid_print
      print(response.data);
       // ignore: avoid_print
      print(news!.articles);
    } on SocketException {
      // ignore: avoid_print
      print("Network Error");
      
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.message);
      
    }
    return news!.articles;
  }

  initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError:
            (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
           // ignore: avoid_print
          print("errr${error.message}");
        },
      ),
    );
  }
}

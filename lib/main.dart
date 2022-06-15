import 'package:flutter/material.dart';
import 'package:news_api/view/homepage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      title: "newapppp",
      home:  const HomePage(),
    );
  }
}

// import 'package:news_api/model/article.dart';

// class News{
//   List<ArticleModel>news=[];

// }

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
// import 'package:news_api/model/article.dart';
// import 'package:news_api/model/http.dart';

// class HttpService {
//   String api_key = "8b33e52b8098457ebf3d96fd2c41b560";
  

//   // Article? article;
//   // late Dio dio;

//   // HttpService() {
//   //   dio = Dio(BaseOptions(baseUrl: baseUrl));
//   //   initializeInterceptors();
//   // }
//     List<ArticleModel>news=[];
  
//   Future<void> getNews() async{

//     String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";

//     var response = await http.get(url as Uri);

//     var jsonData = jsonDecode(response.body);

//     if(jsonData['status'] == "ok"){
//       jsonData["articles"].forEach((element){

//         if(element['urlToImage'] != null && element['description'] != null){
//           ArticleModel article = ArticleModel(
//            title : element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }

//       });
//     }


//   }

//   // initializeInterceptors() {
//   //   dio.interceptors.add(
//   //     InterceptorsWrapper(
//   //       onError:
//   //           (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
//   //         print("errr${error.message}");
//   //       },
//   //     ),
//   //   );
//   // }
//}

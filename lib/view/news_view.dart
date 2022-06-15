import 'package:flutter/material.dart';
import 'package:news_api/model/article.dart';
import 'package:news_api/service/new.dart';

class NewsDetails extends StatefulWidget {
 final int id;
   const NewsDetails({Key? key,required this.id}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Article?>>(
            future: HttpService().getReg(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data![widget.id];
                // ignore: avoid_print
                print(snapshot.data!);
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(
                        data!.urlToImage,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        data.description,
                        style: const TextStyle(
                          height: 1.2,
                          letterSpacing: .3,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
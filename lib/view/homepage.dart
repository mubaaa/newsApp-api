import 'package:flutter/material.dart';
import 'package:news_api/model/article.dart';
import 'package:news_api/model/category.dart';
import 'package:news_api/service/category_service.dart';
import 'package:news_api/service/new.dart';
import 'package:news_api/view/news_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            Text("News",
             style: TextStyle(color: Colors.blue))
          ],
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: 70,
              // width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                      imageUrl: categories[index].imageUrl!,
                      text: categories[index].categoryName!);
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Article?>>(
                  future: HttpService().getReg(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
                          // ignore: avoid_print
                          print(snapshot.data!.length);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => NewsDetails(
                                        id: index,
                                  )),
                                ),
                              );
                            },
                            child: BlogTile(
                                imageUrl: data!.urlToImage,
                                title: data.title,
                                description: data.description),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String text;
  const CategoryTile({
    Key? key,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(size.height);
    //  print(size.width);
    return GestureDetector(
      onTap: () {},
      child: Card(
        // shape: ShapeBorder.lerp(a, b, t),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          // height: size.height * 0.09,
          // // width: size.width * .3,
          // height: 100,
          width: 140,
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description;
  const BlogTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: size.height * .45,
        //  color: Colors.deepPurple,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              // width: 300,
              child: Image.network(
                imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child:  CircularProgressIndicator(),
                  );
                },
              ),
            ),
            //  const SizedBox(
            //   height: 8,
            // ),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 18),
              maxLines: 2,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: const TextStyle(
                  color: Color.fromARGB(255, 129, 128, 128),
                  fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

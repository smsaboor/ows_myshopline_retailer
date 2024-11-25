import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'news_mode.dart';
import 'api.dart';
import 'news_display.dart';

class NewsCol2 extends StatefulWidget {
  const NewsCol2({Key? key}) : super(key: key);
  @override
  State<NewsCol2> createState() => _NewsCol2State();
}

class _NewsCol2State extends State<NewsCol2> {
  late Future<NewsModel> _newsModel;
  @override
  void initState() {
    _newsModel = ApiManager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.47,
      height: MediaQuery.of(context).size.height*.3,
      color: Colors.white10,
      child: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context, snapshot) {
          // check data == true
          if (snapshot.hasData) {
            return ListView.builder(
              // itemCount: snapshot.data!.articles.length,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                var article = snapshot.data!.articles[index];
                return GestureDetector(
                  onTap: (){
                    navigateTo(context, NewsDisplay(article: article,));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.125,
                        width: MediaQuery.of(context).size.width*.5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      article.title??'',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'PoppinsBold',
                                          fontSize: 10),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(article.description??'',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'PoppinsReg',
                                            fontSize: 4)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Card(
                                  color: Colors.white,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: AspectRatio(
                                      aspectRatio: 0.8,
                                      child: Image.network(
                                        article.urlToImage ?? 'https://blog.feedspot.com/wp-content/uploads/2017/12/business-news-websites.jpg',
                                        fit: BoxFit.cover,
                                      ))),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: Colors.black,thickness: .1,)
                    ],
                  ),
                );
              },
            );
          }

          // check data == eror
          if (snapshot.hasError) {
            return Center(
                child:
                Text("Something wron... Check your internet connection"));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

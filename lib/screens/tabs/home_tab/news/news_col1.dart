import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'news_mode.dart';
import 'api.dart';
import 'news_display.dart';

class NewsCol1 extends StatefulWidget {
  const NewsCol1({Key? key}) : super(key: key);
  @override
  State<NewsCol1> createState() => _NewsCol1State();
}

class _NewsCol1State extends State<NewsCol1> {
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
      child: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            // check data == true
            if (snapshot.hasData) {
              return ListView.builder(
                // itemCount: snapshot.data!.articles.length,
                itemCount: 1,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var article = snapshot.data!.articles[index];
                  return GestureDetector(
                    onTap: (){
                      navigateTo(context, NewsDisplay(article: article,));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.27,
                          width: MediaQuery.of(context).size.width*.5,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width*.5,
                                child: Card(
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
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      article.title?? 'null find',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'PoppinsBold',
                                          fontSize: 11),
                                    ),
                                    SizedBox(height: 6),
                                    Text(article.description ?? 'null fimd',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'PoppinsReg',
                                            fontSize: 8)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black,thickness: .1,)
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
      ),
    );
  }
}

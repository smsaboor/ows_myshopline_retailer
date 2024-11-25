import 'package:flutter/material.dart';

class NewsDisplay extends StatefulWidget {
  const NewsDisplay({Key? key,required this.article}) : super(key: key);
final article;
  @override
  State<NewsDisplay> createState() => _NewsDisplayState();
}

class _NewsDisplayState extends State<NewsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News'),centerTitle: true,),
      body: SingleChildScrollView(child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.35,
          width: MediaQuery.of(context).size.width,
          child: Card(
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: AspectRatio(
                  aspectRatio: 0.8,
                  child: Image.network(
                    widget.article.urlToImage ?? 'https://blog.feedspot.com/wp-content/uploads/2017/12/business-news-websites.jpg',
                    fit: BoxFit.cover,
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.article.title?? 'no title null find',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsBold',
                    fontSize: 18),
              ),
              SizedBox(height: 6),
              Text(widget.article.description ?? 'null find',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'PoppinsReg',
                      fontSize: 12)),
            ],
          ),
        ),
      ],),),
    );
  }
}

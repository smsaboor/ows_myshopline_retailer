import 'package:flutter/material.dart';
import 'news_col1.dart';
import 'news_col2.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
      NewsCol1(),
      NewsCol2(),
    ],);
  }
}

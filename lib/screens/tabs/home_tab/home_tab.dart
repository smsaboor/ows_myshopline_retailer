import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/screens/tabs/home_tab/bar_chart_sample2.dart';
import 'bar_chart_sample.dart';
import 'bar_chart_sample3.dart';
import 'package:ows_myshopline_retailer/constants/platform_info.dart';
import 'package:ows_myshopline_retailer/screens/tabs/home_tab/selling_items.dart';
import 'news/news.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool get isDesktopOrWeb => PlatformInfo().isDesktopOrWeb();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                height: MediaQuery.of(context).size.height*.28,
                width: double.infinity,
                child: const BarChartSample2()),
            const SizedBox(height: 5,),
            const SellingItems(),
            const SizedBox(height: 10,),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Latest Market News',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
              ),
            ),
            const News(),
            const SizedBox(height: 100,)
          ],),
        )
      ),
    );
  }
}
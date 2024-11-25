import 'package:flutter/material.dart';
import 'bar_chart_sample.dart';
import 'bar_chart_sample3.dart';

class BarChartPage2 extends StatelessWidget {
  const BarChartPage2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*.25,
      child: BarChartSample3(),
    );
  }
}

import 'package:flutter/material.dart';

class TodayDealsCard extends StatelessWidget {
  const TodayDealsCard(
      {Key? key, required this.image, this.productName, this.details})
      : super(key: key);
  final image, productName, details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Container(
        width: MediaQuery.of(context).size.width*.3,
        height: MediaQuery.of(context).size.height*.20,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image: image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Container(
                  height: 15,
                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        '70% off',
                        style: TextStyle(color: Colors.white,fontSize: 8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Center(
                    child: Text('on Chat',
                      style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Center(
                      child: Text(
                        'Rs 299/-',
                        style: TextStyle(color: Colors.black,fontSize: 8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'MRP: ',
                            style: TextStyle(color: Colors.black,fontSize: 8),
                          ),
                          Text(
                            'RS-499',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Center(
                      child: Text(
                        productName!,
                        style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

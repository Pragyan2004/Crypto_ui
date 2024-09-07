import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  var item;
  Item({this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight=MediaQuery.of(context).size.height;
    double myWidth=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: myWidth*0.06,vertical: myHeight*0.02),
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: myHeight*0.05,
                  child: Image.network(item.image)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.id,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
                SizedBox(height: myHeight*0.02),
                Text("0.4" + item.symbol,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),),
              ],
            ),
          SizedBox(width: myWidth*0.005),
          Expanded(
            flex: 2,
            child: Container(
              height: myHeight*0.03,
              width: myWidth*0.1,
              child: Sparkline(
                data: item.sparklineIn7D.price,
                lineWidth:2.0,
                lineColor: item.marketCapChangePercentage24H >=0
                ?Colors.green
                : Colors.red,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0,0.7],
                  colors: [Colors.red,Colors.red.shade100]
                ),
              ),
            ),
          ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$'+item.currentPrice.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: myHeight*0.02),
                  Row(
                    children: [
                      Text(item.priceChange24H.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),),
                      SizedBox(width: myWidth*0.01),
                      Text(item.marketCapChangePercentage24H.toStringAsFixed(2)+"%",
                        style: TextStyle(
                          fontSize: 15,
                          color:item.marketCapChangePercentage24H >=0
                              ?Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.normal,
                        ),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

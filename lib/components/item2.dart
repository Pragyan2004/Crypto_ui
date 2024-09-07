import 'package:crypto_ui/view/selectcoin.dart';
import 'package:flutter/material.dart';
class Item2 extends StatelessWidget {
  var item;
  Item2({this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight=MediaQuery.of(context).size.height;
    double myWidth=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: myWidth*0.03,vertical: myHeight*0.02),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>SelectCoinone(selectItem: item,)));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: myWidth*0.03,vertical: myHeight*0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey,
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: myHeight*0.04,
                  child: Image.network(item.image),
              ),
              SizedBox(height: myHeight*0.02),
              Text(item.id,
              style: TextStyle(
                fontSize: 18,
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
                      SizedBox(width: myWidth*0.03),
                      Text(item.marketCapChangePercentage24H.toStringAsFixed(2)+"%",
                        style: TextStyle(
                          fontSize: 15,
                          color:item.marketCapChangePercentage24H >=0
                              ?Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.normal,
                        ),),
                ],
              )
            ],
          ),
        ),
    )
    );
  }
}

import 'package:crypto_ui/components/item.dart';
import 'package:crypto_ui/components/item2.dart';
import 'package:crypto_ui/models/coinmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState(){
    getCoinMarket();
        super.initState();
  }
 @override
  Widget build(BuildContext context) {
   double myHeight=MediaQuery.of(context).size.height;
   double myWidth=MediaQuery.of(context).size.width;
   return Scaffold(
      body: Container(
        height:myHeight,
        width: myWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.yellow,
          Color.fromARGB(255,255,219,73),
        ]
      ),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth *0.05 ,vertical: myHeight*0.003),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: myHeight*0.005),
                    decoration:BoxDecoration(
                  color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
              ),
                    child: Text("My Portfolio",
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                    Text("Top 10 coins",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    Text("Experiment",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                ],
            ),
   ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth*0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$ 7,466.20',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  Container(
                    padding: EdgeInsets.all(myWidth*0.01),
                    height: myHeight*0.04,
                    width: myWidth*0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white70.withOpacity(0.5),
                    ),
                    child: Image.asset(
                      'images/icon/5.1.png',
                      height: myHeight*0.01,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: myWidth*0.02),
              child: Row(
                children: [
                  Text('+162% all time',
                    style: TextStyle(
                      fontSize: 16,
                    ),),
                ],
              ),
            ),
            SizedBox(height: myHeight*0.02),
            Container(
            height: myHeight*0.7,
              width: myWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
              child: Column(
                children: [
                  SizedBox(height: myHeight*0.02),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:myWidth*0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Assets",
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                        Icon(Icons.add)
                      ],
                    ),
                ),
                  Expanded(
                    child: isRefreshing == true
                      ? Center(
                      child: CircularProgressIndicator(),
                    ):
                    ListView.builder(
                        itemCount:4,
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return Item (
                            item:coinMarket![index],
                          );
                        }),
                  ),
                     SizedBox(height: myHeight*0.02),
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: myWidth*0.08),
                       child: Row(
                        children: [
                          Text("Recommend to Buy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),),
                        ],
                                           ),
                     ),
                  SizedBox(height: myHeight*0.02),
                  Expanded(
                    child: Container(
                      height: myHeight*0.23,
                      width: myWidth,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: coinMarket!.length,
                          itemBuilder: (context,index){
                        return Item2(
                            item:coinMarket![index]);
                      }),
                    ),
                  )
                ],
              ),

            )
          ],
        ),
      ),
    );
  }

  bool isRefreshing=true;

  List? coinMarket=[];
 var coinMarketList;
 Future<List<CoinModel>?> getCoinMarket() async{
   const url='https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
   setState(() {
     isRefreshing=true;
   });
   var response = await http.get(Uri.parse(url),headers:{
     "Content-Type": "application/json",
     "Accept": "application/json",
   });
   setState(() {
     isRefreshing=false;
   });
   if(response.statusCode==200){
     var x=response.body;
         coinMarketList=coinModelFromJson(x);
         setState(() {
           coinMarket=coinMarketList;
         });
   }else{
     print(response.statusCode);

   }


 }
}

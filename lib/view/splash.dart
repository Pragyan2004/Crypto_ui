import 'package:crypto_ui/view/navBar.dart';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double myHeight=MediaQuery.of(context).size.height;
    double myWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: myWidth*0.14),
          child: Container(
            height: myHeight,
            width: myWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('images/image/1.gif'),
               Column(
                 children: [
                   Text("The future",
                     style: TextStyle(
                         fontSize: 50,
                         fontWeight: FontWeight.bold
                     ),),
                   Text("Learn more about crypto,look to the future in to crypto",
                     style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.normal,
                         color: Colors.grey
                     ),),
                 ],
               ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth*0.05,vertical:myHeight*0.01 ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create Portfolio",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          ),),
                          RotationTransition(
                              turns:
                              AlwaysStoppedAnimation(310/360),
                              child: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

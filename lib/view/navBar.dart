import 'package:crypto_ui/pages/dicsover.dart';
import 'package:crypto_ui/pages/home.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex=0;
  List<Widget> pages=[
    Home(),
    Home(),
    Home(),
    Home(),

  ];

  @override
  Widget build(BuildContext context) {
    double myHeight=MediaQuery.of(context).size.height;
    double myWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: ((value){
            setState(() {
              _currentIndex=value;
            });
          }),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon/1.1.png',
                  height: myHeight*0.03,
                color: Colors.grey,)
              ,label: '',
            activeIcon:Image.asset(
                'images/icon/1.1.png',
                height: myHeight*0.03,
            color: Colors.yellow,
            ),),

            BottomNavigationBarItem(
              icon: Image.asset(
                'images/icon/2.1.png',
                height: myHeight*0.03,
              color: Colors.grey,)
              ,label: '',
              activeIcon:Image.asset(
                  'images/icon/2.1.png',
                  height: myHeight*0.03,
              color: Colors.yellow,),),

            BottomNavigationBarItem(
              icon: Image.asset(
                'images/icon/3.1.png',
                height: myHeight*0.03,
              color: Colors.grey,)
              ,label: '',
              activeIcon:Image.asset(
                  'images/icon/3.1.png',
                  height: myHeight*0.03,
              color: Colors.yellow,),),

            BottomNavigationBarItem(
              icon: Image.asset(
                'images/icon/4.1.png',
                height: myHeight*0.03,
              color: Colors.grey,)
              ,label: '',
              activeIcon:Image.asset(
                  'images/icon/4.1.png',
                  height: myHeight*0.03,
              color: Colors.yellow,),),
          ],
        ),

      ),
    );
  }
}

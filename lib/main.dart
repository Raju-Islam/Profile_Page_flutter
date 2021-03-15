
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ProfileScreen.dart';
/*
void main()=>runApp(MaterialApp(

  home: HomePage(),
));*/

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.purple,
  ),
  home: MyApp(),
));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 var _page=0;
final pages=[HomePage(),ProfilePage()];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,

        color: Colors.deepPurple,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInSine,
        height: 40,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _page=index;
          });
        },
        items: [
          Icon(Icons.home,color: Colors.white,size: 20,),
          Icon(Icons.person,color: Colors.white,size: 20,),
        ],
      ),
      body: pages[_page],
    );
  }
}



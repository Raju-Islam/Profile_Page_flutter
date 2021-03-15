import 'package:flutter/material.dart';
import 'ProfileScreen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "Tab to button to add photo";
  String buttonText = "Add Profile";
  var _page = 0;
  final pages = [HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: button(),
    );
  }

  Widget button() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: new TextStyle(fontSize: 25, color: Colors.purpleAccent),
          ),
          SizedBox(
            height: 15.00,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage();
                  },
                ),
              );
            },
            child: Container(
              height: 40,
              width: 160,
              child: Center(
                  child: Text(
                buttonText,
                style: new TextStyle(fontSize: 20.00, color: Colors.white),
              )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple,
              ),

            ),
          )

        ],

      ),
      
    );
  }
}

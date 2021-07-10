import 'package:flutter/material.dart';
import '../../navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/src/resoureces/secondscreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: FlutterLogo(),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("CHÀO ĐỒNG CHÍ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text("START", style: TextStyle(color: Colors.white, fontSize: 30),),
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text("FLUTTER_UI", style: TextStyle(color: Colors.white, fontSize: 30),),
                    onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:ui';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracers/main.dart';
import 'package:tracers/map.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:tracers/searchPage.dart';
import 'package:tracers/settingsPage.dart';

FirebaseDatabase database = new FirebaseDatabase();
DatabaseReference db = database.reference();
Map ss = {};

Color mg = Colors.blueAccent;

class homePage extends StatefulWidget {

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mg,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Tracers',
            style: TextStyle(fontFamily: "ub",fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          if(index==0){
          }
          else if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context)
            => searchPage()),);
          }
          else if(index==2){
            Navigator.push(context, MaterialPageRoute(builder: (context)
            => settingsPage()),);
          }
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.search_rounded),
              title: Text('Search'),
              activeColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blueAccent,
          ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 7),
                          color: Colors.black38,
                          blurRadius: 12)
                    ]),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'B0023',
                              style: TextStyle(fontFamily: "ub",
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Jogoo Road',
                                  style: TextStyle(fontFamily: "ub",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: w/2.5,),
                                Icon(Icons.timer_rounded, size: 25, color: Colors.blueAccent,),
                                Text(
                                  ' : 30 minutes',
                                  style: TextStyle(fontFamily: "ub",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 35,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlue,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-2, 5),
                                        color: Colors.black38,
                                        blurRadius: 5)
                                  ]),
                              child: MaterialButton(
                                  splashColor: Colors.amber,
                                  focusColor: Colors.amber,
                                  child: Text(
                                    'Return',
                                    style: TextStyle(fontFamily: "ub",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)
                                    => MapPage()),);
                                  }
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracers/homePage.dart';
import 'package:tracers/overviewPage.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:tracers/settingsPage.dart';

Color mg = Colors.blueAccent;
List places = [
  'CBD',
  'Jogoo Road',
  'River Road',
  'Kimathi Street',
  'KCB Plaza',
  'Railways',
  'Koja'
];

class searchPage extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  int _currentIndex = 1;
  int _counter = 0;

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
            Navigator.push(context, MaterialPageRoute(builder: (context)
            => homePage()),);
          }
          else if(index==1){
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

      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 15),
                    child: Container(
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade300,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20)
                          ]),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ListView.builder(

                    physics: const BouncingScrollPhysics(),
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          => OverView(place: places[index], tag: 'p$index',)),);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 7),
                                      color: Colors.black38,
                                      blurRadius: 12)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: w/3.5,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '${places[index]}',
                                          style: TextStyle(fontFamily: "ub",
                                            color: mg,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Icon(Icons.directions_walk_rounded, color: Colors.blueAccent,),
                                            Text(
                                              ' : 100m',
                                              style: TextStyle(fontFamily: "ub",
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Icon(Icons.pedal_bike_rounded, color: Colors.blueAccent,),
                                            Text(
                                              ' : 24',
                                              style: TextStyle(fontFamily: "ub",
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(width: w/7.5,),
                                Hero(
                                  tag: 'p$index',
                                  child: Container(
                                    width: 230,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20), topRight: Radius.circular(30), bottomRight: Radius.circular(30),),
                                      image: DecorationImage(
                                        image: AssetImage('images/Beach.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                      color: mg,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

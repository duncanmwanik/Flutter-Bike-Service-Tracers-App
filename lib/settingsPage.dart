import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:tracers/homePage.dart';
import 'package:tracers/searchPage.dart';

class settingsPage extends StatefulWidget {
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            Navigator.push(context, MaterialPageRoute(builder: (context)
            => searchPage()),);
          }
          else if(index==2){
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
              activeColor: Colors.blueAccent
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blueAccent,
          ),
        ],
      ),
      body: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}

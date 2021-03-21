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


FirebaseDatabase database = new FirebaseDatabase();
DatabaseReference db = database.reference();
Map ss = {};

Color mg = Colors.blueAccent;

class OverView extends StatefulWidget {
  final String place;
  final String tag;
  OverView({this.place, this.tag});
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mg,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.place,
          style: TextStyle(fontFamily: "ub",fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Hero(
              tag: widget.tag,
              child: Container(
                width: w,
                height: h/3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(25), bottomRight: Radius.circular(10),),
                  image: DecorationImage(
                    image: AssetImage('images/Beach.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 60,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
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
                                'Book',
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
              ),
            ),
            Container(
              width: w,
              height: 700,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 7),
                        color: Colors.black38,
                        blurRadius: 12)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

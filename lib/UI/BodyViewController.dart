import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

DefaultTabController body() {
  return new DefaultTabController(
    length: 3,
    child: new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        bottom: new PreferredSize(
          preferredSize: new Size(0.0, 18.0),
          child: new Container(
            child: new TabBar(
              tabs: [
                new Container(
                  child: Opacity(
                    opacity: 0.8,
                    child: new Tab(
                      icon: new Icon(Icons.directions_transit),
                      text: "Foods",
                    ),
                  ),
                ),
                new Container(
                  child: Opacity(
                    opacity: 0.8,
                    child: new Tab(
                      icon: new Icon(Icons.directions_transit),
                      text: "Foods",
                    ),
                  ),
                ),
                new Container(
                  child: Opacity(
                    opacity: 0.8,
                    child: new Tab(
                      icon: new Icon(Icons.directions_transit),
                      text: "Foods",
                    ),
                  ),
                ),
              ],
              indicatorColor: Colors.black,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ),
      body: new TabBarView(
        children: [
          new Icon(
            Icons.directions_car,
            size: 50.0,
          ),
          new Icon(
            Icons.directions_transit,
            size: 50.0,
          ),
          new Icon(
            Icons.directions_bike,
            size: 50.0,
          ),
        ],
      ),
    ),
  );
}

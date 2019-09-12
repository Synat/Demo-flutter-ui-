import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurants/UI/screens/Payment.dart';
import 'package:restaurants/UI/sidbar/Qrscanner.dart';
import 'sidbar/Location.dart';

Drawer drawer(context) {
  var _height = MediaQuery.of(context).size.height;
  var _width = MediaQuery.of(context).size.width;
  return Drawer(
    child: Column(
      children: <Widget>[
        Opacity(
          opacity: 1,
          child: Container(
            height: _height / 5,
            padding: EdgeInsets.only(top: _height / 12),
            color: Color(0xffffa726
                // decoration: BoxDecoration(color: Color(0xffffa726)
                // gradient: LinearGradient(
                //   colors: [Color(0xffffd95b), Color(0xffffd95b)],
                // ),
                ),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.black,
                ),
                radius: 30,
                backgroundColor: Colors.white,
              ),
              title: Text("FlutterDevs"),
              subtitle: Text(
                "flutterDevs@aeologic.com",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
        Container(
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: Icon(Icons.payment),
                  title: Text("Orders & Payments"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Payment()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                  onTap: () {
                    print("Taped2");
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Location"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Location()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: Icon(Icons.scanner),
                  title: Text("QR scanner"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Qrscanner()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help"),
                  onTap: () {
                    print("Taped4");
                  },
                ),
              ),
            ],
          ),
          color: Color(0xFFF5F5F6),
          height: _height - _height / 5,
        ),
      ],
    ),
  );
}

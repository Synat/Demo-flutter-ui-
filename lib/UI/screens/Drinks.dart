import 'package:flutter/material.dart';
import 'package:restaurants/Utils/Data.dart';

class Drinks extends StatefulWidget {
  @override
  _Drinks createState() => _Drinks();
}

class _Drinks extends State<Drinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        // separatorBuilder: (BuildContext context, int index) {
        //   return Align(
        //     alignment: Alignment.centerRight,
        //     child: Container(
        //       height: 0.5,
        //       width: MediaQuery.of(context).size.width,
        //       child: Divider(),
        //     ),
        //   );
        // },
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map notif = notifications[index];
          return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Stack(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          height: 100,
                          width: 80,
                          child: Image.asset('assets/images/coca.png')),
                      contentPadding:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      title: Text("THE BEST DRINK COCACOLA"),
                      subtitle: Container(
                        width: 200,
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Text(
                                "made in Cambodia",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Text(
                                "R 1200",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Container(
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Icon(Icons.add_shopping_cart),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 4, right: 4),
                        child: Image.asset(
                          "assets/images/new.png",
                          width: 40,
                        ),
                      ))
                ],
              ));
        },
      ),
    );
  }
}

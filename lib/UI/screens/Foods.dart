import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

class Foods extends StatefulWidget {
  @override
  _Foods createState() => _Foods();
}

class _Foods extends State<Foods> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(5.0),
      child: new GridView.count(
        crossAxisCount: 2,
        children: new List<Widget>.generate(16, (index) {
          return new GridTile(
            child: new Card(
                margin: EdgeInsets.all(5.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                color: Colors.white,
                child: new Center(
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/food.jpg',
                              width: 300, height: 250, fit: BoxFit.fill),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Betagro Bacon",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Hygienic pork belly with.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff666666)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4 ? Icons.star : Icons.star_border,
                                    size: 15,
                                    color: Colors.amber,
                                  );
                                }),
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Center(
                                      child: Text('\$17.25'),
                                    ),
                                  ),
                                  Flexible(
                                      child: Container(
                                    height: 20,
                                    width: 55,
                                    margin: EdgeInsets.only(left: 30, top: 5),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      child: Text(
                                        'Buy',
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      splashColor: Color(0xffFFA726),
                                      highlightColor: Color(0xffFFA726),
                                      onPressed: () {
                                        // Navigate to second route when tapped.
                                      },
                                    ),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          );
        }),
      ),
    ));
  }
}

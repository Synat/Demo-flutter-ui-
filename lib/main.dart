import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurants/UI/DrawerViewController.dart' as UIDrawer;
import 'package:restaurants/UI/screens/Foods.dart';
import 'package:restaurants/UI/screens/Drinks.dart';
import 'package:restaurants/UI/screens/Devices.dart';
import 'package:restaurants/UI/screens/Notification.dart' as UINoti;
import 'package:restaurants/UI/screens/Addshoppingcart.dart' as UIAddshop;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() => runApp(new MyApp());

class MainScreen extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<MainScreen> {
  PageController _pageController;
  int _page = 1;
  var _title = "Drinks";
  var _titles = ['Foods', 'Drinks', 'Devices'];
  final storage = new FlutterSecureStorage();

  void Start() async {
    var key = "b";
    var value = "2";
    await storage.write(key: key, value: value);
    // print(await storage.read(key: key));
    print("Key store successfull");
  }

  @override
  Widget build(BuildContext context) {
    // this.Start();
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text(_title),
        centerTitle: true,
        actions: <Widget>[
          Opacity(
            opacity: 0.8,
            child: IconButton(
              icon: Icon(
                Icons.notifications,
              ),
              onPressed: () {
                print('open notifications');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UINoti.Notification()),
                );
              },
            ),
          ),
          Container(
            // padding: EdgeInsets.only(left: 20, right: 20),
            child: Opacity(
              opacity: 0.8,
              child: IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
                onPressed: () {
                  print('open add_shopping_cart');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UIAddshop.Addshoppingcard()),
                  );
                },
              ),
            ),
          )
        ],
      ),
      drawer: UIDrawer.drawer(context),
      body: PageView(
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[Foods(), Drinks(), Devices()],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.blur_circular,
              ),
              title: Text("Foods"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.delete_sweep,
              ),
              title: Text("Drinks"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business_center,
              ),
              title: Text("Devices"),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
          selectedItemColor: Color(0xCC000000),
          unselectedItemColor: Color(0x99000000),
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
      this._title = this._titles[page];
    });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Color(0xFFFFA726),
      ),
      home: MainScreen(),
    );
  }
}

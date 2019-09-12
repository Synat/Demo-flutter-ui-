import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import './layout_type.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({
    this.layoutGroup,
    this.onLayoutToggle,
    this.minExtent,
    this.maxExtent,
  });
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: Image.asset('assets/images/card.png', fit: BoxFit.cover),
        ),
        // Positioned(
        //   left: 16.0,
        //   right: 16.0,
        //   bottom: 16.0,
        //   child: Text(
        //     'FOOD',
        //     style: TextStyle(fontSize: 32.0, color: Colors.white),
        //   ),
        // ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class Payment extends StatefulWidget {
  @override
  _Payment createState() => _Payment();
}

class _Payment extends State<Payment> implements HasLayoutGroup {
  _Payment({Key key, this.layoutGroup, this.onLayoutToggle});
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  final items = List<String>.generate(20, (i) => "Purchased One Coca ${i + 1}");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // items.add("One");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order & Payment"),
      ),
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              layoutGroup: layoutGroup,
              onLayoutToggle: onLayoutToggle,
              minExtent: 45.0,
              maxExtent: 200.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final item = items[index];
                return Dismissible(
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  key: Key(item),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    setState(() {
                      items.removeAt(index);
                    });

                    // Then show a snackbar.
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "$item dismissed",
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Color(0xffE1A164),
                    ));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(color: Colors.red),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Card(
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(12),
                            child: Image.asset('assets/images/purchas.png'),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          title: Container(
                            alignment: Alignment(-1.3, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("$item"),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "from store CircleK nearly RUPP.",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff868E96)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "28 mn",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      )),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

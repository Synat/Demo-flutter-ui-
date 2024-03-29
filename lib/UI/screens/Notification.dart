import 'package:flutter/material.dart';
import 'package:restaurants/Utils/Data.dart';

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _NotificationsState();
  }

  Scaffold _NotificationsState() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map notif = notifications[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/notification.png'),
                // backgroundImage: AssetImage(
                //   notif['dp'],
                // ),
                radius: 25,
              ),
              contentPadding: EdgeInsets.all(0),
              title: Text(notif['notif']),
              trailing: Text(
                notif['time'],
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

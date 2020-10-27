import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {

  String Title = 'Title';
  String helper = 'helper';

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.configure(
        onMessage: (message) async{
          setState(() {
            Title = message['Notification']['title'];
            helper = 'Received Notification';
          });
        },
        onResume: (message)async{
          setState(() {
            Title = message['data']['title'];
            helper = 'Received Notification';
          });
        },
        onLaunch: (message)async{
          setState(() {
            Title = message['data']['title'];
            helper = 'Received Notification';
          });
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(Title),
            Text(helper),
          ],
        ),
      ),
    );
  }
}

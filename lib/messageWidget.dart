import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'model/message.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  getToken() {
    _firebaseMessaging.getToken().then((value) {
      print("Device Token: $value");
    });
  }
  @override
  void initState() {
    super.initState();
    getToken();
    _firebaseMessaging.configure(

      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
              title: notification['title'], body: notification['body']));
        });
      },

      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final data = message['data'];
        String mMessage = data['message'];
        setState(() {
          messages.add(Message(
              title: mMessage, body: mMessage));
        });
      },

      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        final data = message['data'];
        String mMessage = data['message'];
        setState(() {
          messages.add(Message(
              title: mMessage, body: mMessage));
        });
      },

    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) => ListView(
    children: messages.map(buildMessage).toList(),
  );

  Widget buildMessage(Message message) => ListTile(
    title: Text(message.title),
    subtitle: Text(message.body),
  );
}

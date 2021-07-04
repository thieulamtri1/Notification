// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// void main() => runApp(MaterialApp(home: MyApp()));
//
// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MyAppState();
//   }
// }
//
// Future<dynamic> myBackgroundHandler(Map<String, dynamic> message) {
//   return MyAppState()._showNotification(message);
// }
//
// class MyAppState extends State<MyApp> {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('notification'),
//       ),
//       body: Center(
//         child: Text('button'),
//       ),
//     );
//   }
//
//   Future _showNotification(Map<String, dynamic> message) async {
//     var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'channel id',
//       'channel name',
//       'channel desc',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     var platformChannelSpecifics =
//         new NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'new message arived',
//       'i want ${message['data']['title']} for ${message['data']['price']}',
//       platformChannelSpecifics,
//       payload: 'Default_Sound',
//     );
//   }
//
//   getTokenz() async {
//     String token = await _firebaseMessaging.getToken();
//     print(token);
//   }
//
//   Future selectNotification(String payload) async {
//     // await flutterLocalNotificationsPlugin.cancelAll();
//   }
//
//   @override
//   void initState() {
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     var initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: selectNotification);
//     super.initState();
//
//     _firebaseMessaging.configure(
//       onBackgroundMessage: myBackgroundHandler,
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('new message arived'),
//                 content: Text(
//                     'i want ${message['notification']['title']} for ${message['notification']['body']}'),
//                 actions: <Widget>[
//                   FlatButton(
//                     child: Text('Ok'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             });
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//       },
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('new message arived'),
//                 content: Text(
//                     'i want ${message['notification']['title']} for ${message['notification']['body']}'),
//                 actions: <Widget>[
//                   FlatButton(
//                     child: Text('Ok'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             });
//       },
//     );
//
//     getTokenz();
//   }
// }
import 'package:flutter/material.dart';
import 'messageWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notification"),
        centerTitle: true,
      ),
      body: MessagingWidget(),
    );
  }
}


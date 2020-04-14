import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  int _counter = 0;

  void _incrementCounter() async {
    await showNoti();
    setState(() {
      _counter++;
    });
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PressScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    // var initializationSettingsIOS = IOSInitializationSettings(
    //     onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future showNoti() async {
    await flutterLocalNotificationsPlugin.cancelAll();

    // List<String> lines = List<String>();
    // lines.add(
    //     'Alex Faarborg sddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd Check this out');
    // lines.add(
    //     'Jeff Chang  dssssssssssssssssssssssssssssssssssssssssssssssssssssssss  Launch Party');

    // InboxStyleInformation inboxStyleInformation = InboxStyleInformation(lines,
    //     contentTitle: '2 new messages', summaryText: 'janedoe@example.com');

    // var bigTextStyleInformation = BigTextStyleInformation('');

    // var scheduledNotificationDateTime =
    //     DateTime.now().add(Duration(seconds: 10));
    // var vibrationPattern = Int64List(4);
    // vibrationPattern[0] = 0;
    // vibrationPattern[1] = 1000;
    // vibrationPattern[2] = 5000;
    // vibrationPattern[3] = 2000;

    // var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //   'your other channel id',
    //   'your other channel name',
    //   'your other channel description',
    //   icon: 'iconm',
    //   color: Color(0x70c5b3),
    //   // largeIcon: DrawableResourceAndroidBitmap('me'),
    //   sound: RawResourceAndroidNotificationSound('slow_spring_board'),
    //   // largeIcon: DrawableResourceAndroidBitmap('me'),
    //   vibrationPattern: vibrationPattern,
    //   playSound: true,
    //   enableVibration: true,
    //   enableLights: true,
    //   styleInformation: bigTextStyleInformation,

    //   // color: const Color.fromARGB(255, 255, 0, 0),
    //   // ledColor: const Color.fromARGB(255, 255, 0, 0),
    //   // ledOnMs: 1000,
    //   // ledOffMs: 500
    // );
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    // // sound: 'slow_spring_board.aiff'
    // var platformChannelSpecifics = NotificationDetails(
    //     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    // await flutterLocalNotificationsPlugin.schedule(0, 'scheduled title',
    //     'rizan', scheduledNotificationDateTime, platformChannelSpecifics);

    // var scheduledNotificationDateTime =
    //     DateTime.now().add(Duration(seconds: 15));
    // var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //     'your other channel id',
    //     'your other channel name',
    //     'your other channel description');
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    // NotificationDetails platformChannelSpecifics = NotificationDetails(
    //     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    // await flutterLocalNotificationsPlugin.schedule(
    //     0,
    //     'Fromtintin ar maa',
    //     'paad disi mona :/',
    //     scheduledNotificationDateTime,
    //     platformChannelSpecifics);
    // var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //     'your channel id', 'your channel name', 'your channel description',
    //     importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    // var platformChannelSpecifics = NotificationDetails(
    //     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    // await flutterLocalNotificationsPlugin.show(
    //     0, 'plain title', 'plain body', platformChannelSpecifics,
    //     payload: 'item x');

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
//Notification 1
    var bigTextStyleInformation =
        BigTextStyleInformation('mood morning! How are you feeling today?');
    var time = Time(10, 00, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      icon: 'iconm',
      color: Color(0x70c5b3),
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      vibrationPattern: vibrationPattern,
      playSound: true,
      enableVibration: true,
      styleInformation: bigTextStyleInformation,
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0, 'mood', '', time, platformChannelSpecifics);

    //Notification 2
    var bigTextStyleInformation2 = BigTextStyleInformation(
        'night-time, mood-time! Some of your friends are now in the mood :)');
    var time2 = Time(20, 10, 0);
    var androidPlatformChannelSpecifics2 = AndroidNotificationDetails(
      'your other channel id2',
      'your other channel name2',
      'your other channel description2',
      icon: 'iconm',
      color: Color(0x70c5b3),
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      vibrationPattern: vibrationPattern,
      playSound: true,
      enableVibration: true,
      styleInformation: bigTextStyleInformation2,
    );

    var iOSPlatformChannelSpecifics2 = IOSNotificationDetails();
    var platformChannelSpecifics2 = NotificationDetails(
        androidPlatformChannelSpecifics2, iOSPlatformChannelSpecifics2);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        1, 'mood', '', time2, platformChannelSpecifics2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: _counter >= 1
          ? null
          : FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
    );
  }
}

class PressScreen extends StatefulWidget {
  PressScreen({Key key}) : super(key: key);

  @override
  _PressScreenState createState() => _PressScreenState();
}

class _PressScreenState extends State<PressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Test Screen"),
        ),
      ),
    );
  }
}

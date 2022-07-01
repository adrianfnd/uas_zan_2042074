import 'package:flutter/material.dart';
import 'package:uas_zan_2042074/Profile.dart';
import 'package:uas_zan_2042074/adddatawidget.dart';
import 'package:uas_zan_2042074/detailwidget.dart';
import 'package:uas_zan_2042074/formkeluhan.dart';
import 'package:uas_zan_2042074/login_page.dart';
import 'package:uas_zan_2042074/models/Keluhan.dart';
import 'package:uas_zan_2042074/listkeluhan.dart';

import 'database/dbkeluh.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: const Center(
        child: Text(''),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.green, Colors.blue])),
              accountName: Text(
                "Kazanova Nugrasyam T",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Admin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: Image(image: AssetImage('assets/side.jpeg')),
                radius: 50,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.assignment,
              ),
              title: const Text('Data Keluhan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => keluhan()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.border_color_rounded,
              ),
              title: const Text('Keluhan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDataWidget()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.emoji_emotions,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_sharp,
              ),
              title: const Text('Log Out '),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}



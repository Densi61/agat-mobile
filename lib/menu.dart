import 'package:agat_mobile/planes.dart';
import 'package:agat_mobile/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'profile.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(),
    );
  }
}

// Main Screen
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _tabs = [
    HomeTab(),
    PlaneTab(),
    ProfileTab(),// see the HomeTab class below
    SettingTab() // see the SettingsTab class below
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Color(0xFF0D4E89),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home, color: Color(0xFFFFFFFF)), label: 'Главная страница'),
              BottomNavigationBarItem(icon: Icon(Icons.airplanemode_active, color: Color(0xFFFFFFFF)), label: 'Воздушные суда'),
              BottomNavigationBarItem(icon: Icon(Icons.person, color: Color(0xFFFFFFFF)), label: 'Профиль '),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Color(0xFFFFFFFF)), label: 'Настройки')
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}

// Home Tab
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.3,
                    1.0,
                  ],
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFF7DAFE7),
                  ],
                ),
              ),
              child: ListView(
                children: [
                  Image.network("https://i.ibb.co/RpCsH03/IMG-1368.png",
                      width: 250.0,
                      height: 250.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Агат - это авиатранспортная компания. А еще я хочу сказать, чтобы вы не критиковали мой дизайн. Я еще не дизайнер, я только учусь. Всех обняла",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}


// Settings Tab


// class Menu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topRight,
//                   end: Alignment.bottomLeft,
//                   stops: [
//                     0.3,
//                     1.0,
//                   ],
//                   colors: [
//                     Color(0xFFFFFFFF),
//                     Color(0xFF7DAFE7),
//                   ],
//                 ),
//               ),
//               child: Center(
//                 child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                     Image.network("https://sun9-51.userapi.com/impg/jaR-Sz4sD7MFMr7HoALo_-WdWVkDAQiIRI46RA/vD5AcSL1I98.jpg?size=1280x534&quality=95&sign=8e5b74f788a486d16a7a142960a9d255&type=album",
//                       width: 250.0,
//                       height: 250.0),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("Агат - это авиатранспортная компания. А еще я хочу сказать, чтобы вы не критиковали мой дизайн. Я еще не дизайнер, я только учусь. Всех обняла",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 21, fontFamily: 'Roboto', color: Colors.black)
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//         )
//     );
//     throw UnimplementedError();
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'main.dart';
import 'menu.dart';


class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
              child: SafeArea(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            NeumorphicButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => MyApp()));
                              },
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.exit_to_app,
                                color: Color(0xC9487BC9),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Image.asset('images/icon.png',
                        width: MediaQuery.of(context).size.width,
                        height: 250.0,
                        alignment: Alignment.center),
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: Card(
                        elevation: 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text("Администратор",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, fontFamily: 'Roboto', color: Colors.black, fontWeight: FontWeight.w800)),
                              Text(""
                                  "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)),
                              Text("Иванов Иван Иванович",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)),
                              Text(""
                                  "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)),
                              Text("Email: ivanivanov@gmail.com",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black, wordSpacing: 150)),
                              Text(""
                                  "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)),
                              Text("Телефон для связи:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)),
                              Text("+7(900)999-99-99",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)),
                              Text(""
                                  "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black)),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    NeumorphicButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => MyApp()));
                                      },
                                      style: NeumorphicStyle(
                                      ),
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Создать нового пользователя",
                                        style: TextStyle(fontSize: 17, fontFamily: 'Roboto', color: Color(0xC9487BC9)),
                                      )
                                    ),
                                    NeumorphicButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => MyApp()));
                                      },
                                      style: NeumorphicStyle(
                                        shape: NeumorphicShape.flat,
                                        boxShape: NeumorphicBoxShape.circle(),
                                      ),
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.info_outline_rounded,
                                        color: Color(0xC9487BC9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        )
                    ),
                  )
                  ],
                ),
              ),
            )
        )
    );
    throw UnimplementedError();
  }
}

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
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
//               child: SafeArea(
//                 child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(15.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             NeumorphicButton(
//                               onPressed: () {
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) => Menu()));
//                                 },
//                               style: NeumorphicStyle(
//                                 shape: NeumorphicShape.flat,
//                                 boxShape: NeumorphicBoxShape.circle(),
//                               ),
//                               padding: const EdgeInsets.all(25.0),
//                               child: Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Color(0xC9487BC9),
//                               ),
//                             ),
//                             NeumorphicButton(
//                               onPressed: () {
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) => MyApp()));
//                                 },
//                               style: NeumorphicStyle(
//                                 shape: NeumorphicShape.flat,
//                                 boxShape: NeumorphicBoxShape.circle(),
//                               ),
//                               padding: const EdgeInsets.all(25.0),
//                               child: Icon(
//                                 Icons.exit_to_app,
//                                 color: Color(0xC9487BC9),
//                               ),
//                             ),
//                           ]
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

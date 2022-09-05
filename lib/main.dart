import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isPressed = false;
  bool isChecked = false;
  TextEditingController loginController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String password = '';
  GlobalKey <ScaffoldState> _globalKey = GlobalKey <ScaffoldState>();


  checkAuth(String login, String password) async
  {
    var dio = Dio();
    var formData = FormData.fromMap({
      'username': login,
      'password': password,
    });
    var response = await dio.post(
        'https://fierce-thicket-59078.herokuapp.com/api/auth',
        data: formData,
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    if(response.statusCode==200)
    {
      print(response);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Menu()));
    }
    if(response.statusCode==422)
    {
      for(var i = 0; i<response.data['errors'].length;i++)
        print(response.data["errors"][i]);
    }
  }
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.blue;
    }
    return Scaffold(
      key: _globalKey,
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
              )
          ),
          child: Center(
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: loginController,
                  decoration: InputDecoration(
                      labelText: "Логин",
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                          color: Colors.black),
                      prefixIcon: Icon(Icons.person,color: Colors.black)
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Пароль",
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                          color: Colors.black),
                      prefixIcon: Icon(Icons.lock, color: Colors.black)
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text("Запомнить вход", textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17)
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        )
                      ]
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicButton(
                      padding: EdgeInsets.only(top: 10, bottom:10, left:40, right:40),
                      onPressed: () {
                        checkAuth(loginController.text, passwordController.text);
                        isPressed = true;
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          color: Color(0xFF1E90FF)
                      ),
                      child: Text("Войти", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: _textColor(context))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Color _textColor(BuildContext context) {
    if (isPressed == false) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;
import 'package:agat_mobile/plane_info.dart';

import 'main.dart';
import 'menu.dart';



class PlaneTab extends StatelessWidget {
  static var air_mass = {};


  const PlaneTab({Key? key}) : super(key: key);

  //GlobalKey <ScaffoldState> _globalKey = GlobalKey <ScaffoldState>();

  getPlanes() async {
    var url_api = Uri.parse(
        "https://fierce-thicket-59078.herokuapp.com/api/aircraft/all");
    var response = await http.get(url_api);
    PlaneTab.air_mass = jsonDecode(response.body);
    print(PlaneTab.air_mass);
    return PlaneTab.air_mass;
  }
  String getPlanesImage(String type) {
    switch (type) {
      case 'Вертолет':
        return 'https://i.ibb.co/qN0vN67/helicopter-silhouette.png';
      case 'Самолет':
        return 'https://i.ibb.co/qyFdWqK/airplane.png';
      case 'Аэростат':
        return 'https://i.ibb.co/s2H0758/hot-air-balloon.png';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    getPlanes();
    return Scaffold(
      //key: _globalKey,
      body: FutureBuilder(
          future: getPlanes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  for(int i = 0; i <
                      PlaneTab.air_mass["results"].length; i++)
                    InkWell(
                      focusColor: Color.fromARGB(211, 189, 238, 255),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom : BorderSide(width: 2, color: Colors.blue)),
                          //color: Color.fromARGB(211, 189, 238, 255),
                        ),
                       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                       child:
                         Row(
                          children:[
                            new Image.network(
                                getPlanesImage(PlaneTab.air_mass["results"][i]["ac_category"].toString()),
                                    width: 50, height: 50
                            ),
                            // Image.network('https://i.ibb.co/qyFdWqK/airplane.png', width: 50, height:50),
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                               child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Row( children: [
                                 Row( children: [
                                   Text("Тип: ", style: TextStyle(fontWeight: FontWeight.bold),
                                   ),
                                   Text(PlaneTab.air_mass["results"][i]["ac_type"]),
                                 ],
                                 ),
                               ],
                                 ),
                        Row( children: [
                          Row( children: [
                            Text("Бортовой №: ", style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(PlaneTab.air_mass["results"][i]["board_num"]),
                          ],
                          ),
                        ],
                        ),//Row ( Text("Бортовой №: " + PlaneTab.air_mass["results"][i]["board_num"]),
                                ],
                              ),
            ),
            ],
            ),

                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => PlanePage(url: PlaneTab.air_mass["results"][1]["url"]))));
                      },
                    ),
                    ],
                    );
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}
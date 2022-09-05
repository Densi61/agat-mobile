import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class PlanePage extends StatelessWidget {

  final String url;

  static var plane = {};
  const PlanePage({Key? key, required this.url}) : super(key: key);

  getPlane() async
  {
    var url_api = Uri.parse(url);
    var response = await http.get(url_api);
    plane = jsonDecode(response.body);
    print(plane);
    return plane;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPlane(),
          builder: (context,snapshot){
            if(snapshot.hasData)
            {
             return ListView(
               children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(top: 15),
                      child: Text("Название вс: " + plane['board_num'].toString()),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(top: 10),
                      child: Text("" +plane['factory_num'].toString()),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(top: 10),
                      child: Text("" +plane['factory_made_by'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['ac_type'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['ac_category'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['repairs_count'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['assigned_res'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['overhaul_res'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['operator'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['owner'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   margin: EdgeInsets.only(top: 10),
                   child: Text("" +plane['rent_doc_num'].toString()),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 25),
                   margin: EdgeInsets.only(top: 25),
                   child: Text("" +plane['release_date']['date'].toString().substring(0,10)),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 25),
                   margin: EdgeInsets.only(top: 25),
                   child: Text("" +plane['last_repair_date']['date'].toString().substring(0,10)),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 25),
                   margin: EdgeInsets.only(top: 25),
                   child: Text("" +plane['assigned_exp_date']['date'].toString().substring(0,10)),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 25),
                   margin: EdgeInsets.only(top: 25),
                   child: Text("" +plane['overhaul_exp_date']['date'].toString().substring(0,10)),
                 ),
                 /*Container(
                   padding: EdgeInsets.symmetric(horizontal: 25),
                   margin: EdgeInsets.only(top: 25),
                   child: Text("" +plane['']),
                 ),*/
               ],
                );
            }
            return Center(
                child: CircularProgressIndicator()
            );
          }

      ),
    );
  }
}

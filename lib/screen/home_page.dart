import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'dart:convert';

import './calendar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  static const String _title = 'PCR Pooltest App';


  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {

  var _userDaten;
  void getData() async{
    var url="http://10.0.2.2:8080/api/getUser/1";

    http.Response response = await http.get(Uri.parse(url),headers: {
      "Accept":"application/json"
    });

    Map data = json.decode(response.body);
    print(data["vorname"]);

    setState(() {
      //_userDaten=data;
    });
  }
/*
  @override
  void initState(){
    super.initState();
    getData();
  }
*/
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Willkommen "),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 300.0,
                height: 200.0,
                alignment: Alignment.topLeft,
                child: Text("Willkommen!"+"\nWas möchtest du tun?",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 70),
                  maximumSize: const Size(300, 70),
                  primary: Colors.lightBlueAccent,
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 25
                  ),
                ),
                //disabeln kann man wenn hier null steht
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      child: TableEventsExample(),
                      type: PageTransitionType.rightToLeft),
                      (route) => false,

                  );
                },
                child: const Text('Termin buchen'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 70),
                  maximumSize: const Size(300, 70),
                  primary: Colors.lightBlueAccent,
                  textStyle: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  
                },
                child: const Text('Termin einsehen'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 70),
                  maximumSize: const Size(300, 70),
                  primary: Colors.lightBlueAccent,
                  textStyle: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                onPressed: () {},
                child: const Text('persönliche Daten einsehen'),
              ),
            ],
          ),
        )
    );
  }
}
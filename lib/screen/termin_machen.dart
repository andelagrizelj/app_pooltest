import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import './home_page.dart';
import './calendar.dart';
import './utils.dart';


class TerminMachen extends StatelessWidget {
  // In the constructor, require a Todo.
  const TerminMachen({Key? key, required this.event}) : super(key: key);

  // Declare a field that holds the Todo.
  final Event event;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminbuchung'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Column(
          children: <Widget>[ 
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text('Möchtest du diesen Termin buchen?',
                      style: TextStyle(fontSize: 19)),
              ),
            ),
            Text('${DateFormat('dd.MM.yy  HH:mm').format(event.time)}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
        ]),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 60),
                  primary: new Color.fromARGB(255, 63, 194, 255),
                  textStyle: const TextStyle(
                    fontSize: 25,
                  )),
                onPressed: () {Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    child: Homepage(),
                    type: PageTransitionType.rightToLeft),
                    (route) => false,
                );
              }, 
                child: const Text('Bestätigen'))
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 60),
                  primary: Color.fromARGB(255, 226, 81, 81),
                  textStyle: const TextStyle(
                    fontSize: 25,
                  )),
              onPressed: () {Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    child: Homepage(),
                    type: PageTransitionType.rightToLeft),
                    (route) => false,
                );
              }, 
                child: const Text('Abbrechen'))
            )
          ]
        )
      ]),
    );
  }
}
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  static const String _title = 'PCR Pooltest App';

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {

    //final ButtonStyle style =
    //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 10));

    return Center(
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
            child: Text('Hallo XY, \nWas möchtest du tun?',
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
            onPressed: () {},
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
            onPressed: () {},
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
    );
  }
}
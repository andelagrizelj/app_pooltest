import 'package:app_pooltest/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'PCR Pooltest App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text(_title)),
          //body: const MyStatefulWidget(),
          body: ListView(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              children: const <Widget>[
                LoginPage()
              ]
          )
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  bool _isChecked = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _vornameController = TextEditingController();
  TextEditingController _geburtsdatumController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefonController = TextEditingController();
  TextEditingController _klasseController = TextEditingController();

  Future createUser() async {
    var url = "http://10.0.2.2:8080/api/createTeilnehmer";

    Map data={
      'vorname':_vornameController.text,
      'nachname':_nameController.text,
      'email':_emailController.text
    };

    var body = json.encode(data);

    http.Response response = await http.post(Uri.parse(url), headers: {
      "Content-Type":"application/json"},
        body:body);

    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    var checkedValue;
    return Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.white,
              width: 500.0,
              height: 20.0,
              alignment: Alignment.topLeft,
              child: Text('Geben Sie bitte ihre persönlichen Daten ein',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _vornameController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Vorname',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _geburtsdatumController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Geburtsdatum',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-Mail Adresse',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _telefonController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefonnummer',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _klasseController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Klasse',
              ),
            ),
            const SizedBox(height: 10),
            CheckboxListTile(
              title: Text(
                  "Ich stimme der unter folgendem Link zu findenden Datenschutzerklärung zu: “Datenschutzerklärung.de”"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                maximumSize: const Size(300, 50),
                primary: Colors.lightBlueAccent,
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25
                ),
              ),
              //disabeln kann man wenn hier null steht
              onPressed: () {
                createUser().then((value) =>
                  Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      child: Homepage(),
                      type: PageTransitionType.rightToLeft),
                      (route) => false,

                )
                );
              },
              child: const Text('Weiter'),
            ),
          ],
        )
    );
  }
}
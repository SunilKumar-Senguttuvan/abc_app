import 'package:flutter/material.dart';
import 'package:tts/tts.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ABC App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
                child: buildText()),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton(
                    onPressed: moveBackward,
                    child: Center(
                      child: Text('<',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: speakLetter,
                    icon: Icon(Icons.speaker_phone),
                    iconSize: 40.0,
                    splashColor: Colors.cyan,
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: moveForward,
                    child: Center(
                      child: Text('>',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Text alphabetText;
  Text buildText() {
    alphabetText = Text(
            String.fromCharCode(ch),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 400.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          );
    return alphabetText;
  }

  int ch = 65;
  void moveBackward() {
    setState(() {
      ch = (ch-1<65) ? 65 : ch-1;
    });
  }

  void moveForward() {
    setState(() {
      ch = (ch+1>91) ? 91 : ch+1;
    });
  }

  void speakLetter() async{
    Tts.speak(alphabetText.data);
  }
}

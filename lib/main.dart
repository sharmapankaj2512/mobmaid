import 'package:flutter/material.dart';
import 'package:mobmaid/mob.dart';

import 'Participant.dart';
import 'Participants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome To Mobmaid!',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(title: 'Welcome To Mobmaid!'),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  final _mob = Mob();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: TextField(
                  key: const Key('participant_name'),
                  onSubmitted: _join,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Participant Name',
                  ),
                ))
              ],
            ),
            Row(
              children: [Participants(participants: _mob.participants())],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  makeParticipants() {
    return _mob.participants().map<Widget>((participant) {
      return Participant(participant: participant);
    }).toList();
  }

  void _join(String participant) {
    setState(() {
      _mob.join(participant);
    });
  }
}

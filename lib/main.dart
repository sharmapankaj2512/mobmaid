import 'package:flutter/material.dart';

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

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Participant Name',
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  children: [
                    Image.network('https://picsum.photos/250?image=1'),
                    Image.network('https://picsum.photos/250?image=2'),
                    Image.network('https://picsum.photos/250?image=3'),
                    Image.network('https://picsum.photos/250?image=4'),
                  ],
                ))
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

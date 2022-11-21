import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String theText = "Hello";
Icon theIcon = Icon(Icons.arrow_forward_ios_rounded);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
        centerTitle: false,
      ),
      body: Text(
        "$theText",
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
      ),
      floatingActionButton: FloatingActionButton(
        child: theIcon,
        onPressed: () {
          TextNIconChange();
        },
      ),
    ));
  }

  TextNIconChange() {
    setState(() {
      if (theText == "Hello") {
        theText = "World";
        theIcon = Icon(Icons.arrow_back_ios_new_rounded);
      } else {
        theText = "Hello";
        theIcon = Icon(Icons.arrow_forward_ios_rounded);
      }
    });
  }
}

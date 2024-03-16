import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Language Group Chat",
          style: TextStyle(color: Colors.white),
          // textAlign: Center(widthFactor: kToolbarHeight),
        )),
        backgroundColor: Colors.teal[400],
      ),
      body: Center(
          child: TextButton(
              onPressed: () {},
              child: Text(
                "Initiate Group chat",
                style: TextStyle(color: Colors.teal),
              ))),
    );
  }
}

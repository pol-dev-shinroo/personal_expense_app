import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              color: Colors.blue,
              shape: Border.all(width: 1, color: Colors.blue),
              elevation: 5,
              child: const SizedBox(
                width: double.infinity,
                child: Text("Chart!"),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Card(
                child: Text("List of TX"),
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import "./transaction.dart";

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(id: "1", title: "Nike Shoes", amount: 12, date: DateTime.now()),
    Transaction(
        id: "2", title: "Addidas Shoes", amount: 15, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const Card(
              color: Colors.amber,
              child: SizedBox(
                child: Text("List of TX"),
              ),
            ),
          ],
        ));
  }
}

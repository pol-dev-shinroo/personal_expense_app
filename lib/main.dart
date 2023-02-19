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
    Transaction(
        id: "1", title: "Nike Shoes", amount: 12.86, date: DateTime.now()),
    Transaction(
        id: "2", title: "Addidas Shoes", amount: 15.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Column(
              children: transactions.map((item) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber, width: 2),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "cursive",
                              color: Colors.purple),
                          item.amount.toString(),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item.title),
                          Text(
                            item.date.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}

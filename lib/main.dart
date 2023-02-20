import 'package:flutter/material.dart';
import "./widgets/user_transaction.dart";

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // String? titleInput;
  // String? amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("My Expense"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            const UserTransaction(),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import "./models/transaction.dart";
import "./widgets/textInput_fields.dart";
import "./widgets/transaction_list.dart";

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: "1", title: "Nike Shoes", amount: 12.86, date: DateTime.now()),
    Transaction(
        id: "2", title: "Addidas Shoes", amount: 15.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }

  void _toggleBtn(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TextInputFields(addTransaction: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("My Expense"),
        actions: <Widget>[
          IconButton(
              onPressed: () => _toggleBtn(context), icon: const Icon(Icons.add))
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
            TransactionList(transactions: transactions),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _toggleBtn(context),
      ),
    );
  }
}

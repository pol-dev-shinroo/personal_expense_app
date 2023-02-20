import 'package:flutter/material.dart';
import "../models/transaction.dart";
import "../widgets/textInput_fields.dart";
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
        id: "1", title: "Nike Shoes", amount: 12.86, date: DateTime.now()),
    Transaction(
        id: "2", title: "Addidas Shoes", amount: 15.99, date: DateTime.now()),
  ];

  // underscore to mark this method as private
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextInputFields(addTransaction: _addNewTransaction),
        TransactionList(transactions: transactions),
      ],
    );
  }
}

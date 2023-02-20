import 'package:flutter/material.dart';
import "../models/transaction.dart";
import "../widgets/TextInputFields.dart";
import "../widgets/transactionList.dart";

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextInputFields(),
        TransactionList(userTransactions: transactions),
      ],
    );
  }
}

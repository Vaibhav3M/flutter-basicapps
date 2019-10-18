import 'package:flutter/foundation.dart';

class transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  static List<transaction> transactions = [];

//  [
//    transaction("1", "Grocery", 34.0, DateTime.now()),
//    transaction("2", "Mobile bill", 50.0, DateTime.now())
//
//  ];


  transaction(@required this.id, @required this.title, @required this.amount,
      @required this.date);


  static List<transaction> getTransactions() {

    return transactions;
  }

  static List<transaction> addTransaction(transaction tx){

    transactions.add(tx);

    return transactions;
  }
}

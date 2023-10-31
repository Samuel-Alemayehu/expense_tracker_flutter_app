import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Categories { food, travel, lesure, work }

const categoryIcons = {
  Categories.food: Icons.lunch_dining,
  Categories.lesure: Icons.movie,
  Categories.travel: Icons.flight_takeoff,
  Categories.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final Categories category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}

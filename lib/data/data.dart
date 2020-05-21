import 'dart:math';

import 'package:uicontroledespesasapp/models/category_model.dart';
import 'package:uicontroledespesasapp/models/expense_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_generateExpenses() {
  List<Expense> expenses = [
    Expense(name: 'Item 0', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 1', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 2', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 3', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 4', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 5', cost: rand.nextDouble() * 90),
  ];
  return expenses;
}

List<Category> categories = [
  Category(name: 'Alimentação', maxAmount: 450, expenses: _generateExpenses()),
  Category(name: 'Roupas', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Futilidades', maxAmount: 600, expenses: _generateExpenses()),
  Category(name: 'Entretenimento', maxAmount: 330, expenses: _generateExpenses()),
  Category(name: 'Transporte', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Habitação', maxAmount: 1000, expenses: _generateExpenses()),
];

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicontroledespesasapp/data/data.dart';
import 'package:uicontroledespesasapp/helpers/colors_helper.dart';
import 'package:uicontroledespesasapp/models/category_model.dart';
import 'package:uicontroledespesasapp/models/expense_model.dart';
import 'package:uicontroledespesasapp/widgets/bar_char.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            pinned: true,
            expandedHeight: 100,
            leading: IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              iconSize: 30,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Controle Financeiro',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BarChar(expanses: weeklySpending),
                  );
                } else {
                  final Category category = categories[index - 1];
                  double totalAmount = 0;
                  category.expenses.forEach((Expense expense) {
                    totalAmount += expense.cost;
                  });
                  return _buildCategory(category, totalAmount);
                }
              },
              childCount: 1 + categories.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(Category category, double totalAmount) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'R\$ ${(category.maxAmount - totalAmount).toStringAsFixed(2)} / R\$ ${(category.maxAmount).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
             final double maxBarWidth = constraints.maxWidth;
             final double percent = (category.maxAmount - totalAmount) / category.maxAmount;
             double barWidth = percent * maxBarWidth;
             
             if(barWidth < 0) barWidth = 0;
              return Stack(
                children: <Widget>[
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: barWidth,
                    decoration: BoxDecoration(
                      color: getColor(context, percent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

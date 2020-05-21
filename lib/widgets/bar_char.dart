import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicontroledespesasapp/widgets/bar.dart';

class BarChar extends StatelessWidget {
  final List<double> expanses;

  BarChar({this.expanses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expanses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Despesas Semanais',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.3,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 20,
                onPressed: () {},
              ),
              Text(
                '18/05/20 - 23/05/20',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 20,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(
                label: 'Dom',
                amountSpent: expanses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Seg',
                amountSpent: expanses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Ter',
                amountSpent: expanses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Quar',
                amountSpent: expanses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Qui',
                amountSpent: expanses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sex',
                amountSpent: expanses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sab',
                amountSpent: expanses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

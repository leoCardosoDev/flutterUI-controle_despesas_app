import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxbarHeight = 150.0;

  Bar({@required this.label, @required this.amountSpent, @required this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxbarHeight;
    return Flexible(
      child: Column(
        children: <Widget>[
          Text(
            'R\$${amountSpent.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: barHeight,
            width: 14,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
         Text(label, style: TextStyle(fontWeight: FontWeight.bold,),),
        ],
      ),
    );
  }
}

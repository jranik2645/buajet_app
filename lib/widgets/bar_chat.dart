import 'package:flutter/material.dart';

class ChatBar extends StatelessWidget {
  final List<double> expenses;
  ChatBar(this.expenses);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0.0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            "Weekly Spending",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
                iconSize: 30,
              ),
              Text(
                "Aug 18, 2023 - Aug 24, 2024",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: "Sun",
                spendAmount: expenses[0],
                mostEexpensive: mostExpensive,
              ),
              Bar(
                  label: "Mon",
                  spendAmount: expenses[1],
                  mostEexpensive: mostExpensive),
              Bar(
                  label: "Tue",
                  spendAmount: expenses[2],
                  mostEexpensive: mostExpensive),
              Bar(
                  label: "Wed",
                  spendAmount: expenses[3],
                  mostEexpensive: mostExpensive),
              Bar(
                  label: "Thu",
                  spendAmount: expenses[4],
                  mostEexpensive: mostExpensive),
              Bar(
                  label: "Fri",
                  spendAmount: expenses[5],
                  mostEexpensive: mostExpensive),
              Bar(
                  label: "Sat",
                  spendAmount: expenses[6],
                  mostEexpensive: mostExpensive),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double mostEexpensive;

  const Bar(
      {super.key,
      required this.label,
      required this.spendAmount,
      required this.mostEexpensive});

  final double _maxBarHeight = 150;

  @override
  Widget build(BuildContext context) {
    final double barHeight = spendAmount / mostEexpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          "\$${barHeight.toStringAsFixed(0)}",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: barHeight,
          width: 16,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

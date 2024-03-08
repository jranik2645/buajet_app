import 'package:buajet_app/data/data.dart';
import 'package:buajet_app/helper/helper_color.dart';
import 'package:buajet_app/models/category_model.dart';
import 'package:buajet_app/screens/categoryscreen.dart';
import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import '../widgets/bar_chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            forceElevated: true,
            backgroundColor: Colors.green,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                "Financial Budget",
                style: TextStyle(fontSize: 18),
              ),
              centerTitle: true,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              iconSize: 30,
              color: Colors.white,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                iconSize: 30,
                color: Colors.white,
              ),
            ],
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  //  height: 120,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ]),
                  child: ChatBar(weeklySpending),
                );
              } else {
                double totalAmountSpend = 0.0;
                Category category = catergories[index - 1];
                for (var expense in category.expenses) {
                  totalAmountSpend += expense.cost;
                }
                return _buildCategory(category, totalAmountSpend);
              }
            }, childCount: 1 + catergories.length),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(Category category, double totalAmountSpend) {
    return GestureDetector(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoryScreen(category: category))
    ),
      child: Container(
        height: 100,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, offset: Offset(0, 2), blurRadius: 6.0),
            ]),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${(category.maxAmount - totalAmountSpend).toStringAsFixed(2)}/ \$${category.maxAmount}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
                 SizedBox(
                    height: 10,
                 ),
               LayoutBuilder(builder:(BuildContext contex, BoxConstraints constraints){
      
                  final double  maxBarWidth=constraints.maxWidth;
                  final double percent=
                  (category.maxAmount -totalAmountSpend)/totalAmountSpend;
                   double barWidth =percent * maxBarWidth;
                   if(barWidth <0){
                      barWidth =0;
                   }
                    return Stack(
                       children: [
                           Container(
                              height: 20,
                              decoration: BoxDecoration(
                                 color: Colors.grey.shade200,
                                 borderRadius: BorderRadius.circular(15),
                              ),
                           ),
                         Container(
                           height: 20,
                           width:barWidth,
                           decoration: BoxDecoration(
                             color: getColor(context, percent),
                             borderRadius: BorderRadius.circular(15),
                           ),
                         ),
                       ],
                    );
               })
            ],
          ),
        ),
      ),
    );
  }
}

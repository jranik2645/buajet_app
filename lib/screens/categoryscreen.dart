
import 'package:buajet_app/helper/helper_color.dart';
import 'package:buajet_app/models/category_model.dart';
import 'package:buajet_app/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

import '../models/expense_model.dart';

class CategoryScreen extends StatefulWidget {
    final Category category;

  const CategoryScreen( {super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
      double totalAmountSpend= 0.0;
       for(var expense in widget.category.expenses){
         totalAmountSpend +=expense.cost;
       }
         final double  amountLeft=widget.category.maxAmount -totalAmountSpend;
         double perccent =amountLeft/widget.category.maxAmount;
    return Scaffold(
         appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(widget.category.name),
            centerTitle: true,
         ),
         body:  SingleChildScrollView(
            child: Column(
               children: [
                  Container(
                     height:200,
                     width: double.infinity,
                     padding: EdgeInsets.all(12),
                     margin: EdgeInsets.all(12),
                     decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                         boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                               blurRadius: 6.0,
                            ),
                         ],

                     ),
                      child: CustomPaint(
                        foregroundPainter: RadialPainter(
                          bgColor: Colors.grey.shade200,
                           lineColor: getColor(context, perccent),
                           percent: perccent,
                           width:  15

                        ),
                        child: Center(
                           child: Text(
                              "\$${(widget.category.maxAmount - totalAmountSpend).toStringAsFixed(2)}/ \$${widget.category.maxAmount.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 18,
                                 fontWeight: FontWeight.w600,
                              ),
                           ),
                        ),
                      ),
                  ),
                   _buildCategoryItems()
               ],
            ),
         ),
    );
  }

  _buildCategoryItems() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expense expense) {
      expenseList.add(Container(
        height: 80,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, offset: Offset(0, 2), blurRadius: 6.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                expense.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                expense.cost.toStringAsFixed(2),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ));
    });
         return Column(
            children:expenseList,
         );
  }
}

import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    required this.title,
    this.description,
    this.isImportant = false,
    required this.tag,
  });

  final String title;
  final String? description;
  final bool? isImportant;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[50],

      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: switch (tag) {
                    'income' => Colors.green[500],
                    'expense' => Colors.red,
                    'saving' => Colors.indigo,
                    _ => Colors.black,
                  },
                  radius: 35,
                  child: Icon(
                    Icons.candlestick_chart_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(description ?? '', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    color: isImportant == true
                        ? Colors.red
                        : Colors.indigo[200],
                    Icons.crisis_alert,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

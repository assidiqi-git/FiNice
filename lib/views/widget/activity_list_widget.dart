import 'package:flutter/material.dart';

class ActivityListWidget extends StatelessWidget {
  const ActivityListWidget({
    super.key,
    required this.title,
    this.description,
    required this.icon,
  });

  final String title;
  final String? description;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    const double height = 60;
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: height,
                color: Colors.indigo[50],
                child: icon,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: height,
                width: double.infinity,
                color: Colors.indigo[50],
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
              flex: 3,
              child: Container(
                height: height,
                width: double.infinity,
                color: Colors.indigo[50],
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Rp 5.000.000',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('Tagihan', style: TextStyle(fontSize: 13)),
                    ],
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

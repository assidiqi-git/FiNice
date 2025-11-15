import 'package:finice/views/widget/activity_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(height: 90, color: Colors.indigo[400]),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        color: Colors.indigo[100],
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 10,
                            bottom: 5,
                            right: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                  // color: Colors.indigo,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Rp 15.000.000',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text(
                          'Pemasukan VS Pengeluaran Bulan Ini',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Center(
                        child: Text(
                          'INI NANTI CHART',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),

                      Center(
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Recent Transactions',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActivityListWidget(
                  icon: Icon(
                    Icons.arrow_circle_up,
                    size: 40,
                    color: Colors.green,
                  ),
                  title: 'Gaji Bulanan',
                  description: 'Ini Contoh Desctiption',
                ),
                ActivityListWidget(
                  icon: Icon(
                    Icons.fastfood_rounded,
                    size: 40,
                    color: Colors.red,
                  ),
                  title: 'Makan Siang',
                  description: 'Ini Contoh Desctiption',
                ),
                ActivityListWidget(
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                    size: 40,
                    color: Colors.red,
                  ),
                  title: 'Belanja Bulanan',
                  description: 'Ini Contoh Desctiption',
                ),
                ActivityListWidget(
                  icon: Icon(
                    Icons.arrow_circle_up,
                    size: 40,
                    color: Colors.green,
                  ),
                  title: 'Bonus Lembur',
                  description: 'Ini Contoh Desctiption',
                ),
                ActivityListWidget(
                  icon: Icon(
                    Icons.arrow_circle_up,
                    size: 40,
                    color: Colors.green,
                  ),
                  title: 'Gacha',
                  description: 'Ini Contoh Desctiption',
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

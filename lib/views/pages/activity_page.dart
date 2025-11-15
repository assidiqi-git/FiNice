import 'package:finice/views/widget/activity_list_widget.dart';
import 'package:finice/views/widget/date_range_widget.dart';
import 'package:finice/views/widget/dropdown_widget.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String? selectedCategory;
  List<String> categories = ["Elektronik", "Fashion", "Makanan"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                // color: Colors.amber,
                height: 60,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: null,
                        child: Text('All'),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: () {},
                        child: Text('Income'),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: () {},
                        child: Text('Expense'),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: () {},
                        child: Text('Saving'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DateRangeWidget(),
            DropdownWidget<String>(
              labelText: "Kategori",
              hintText: "Pilih kategori...",
              value: selectedCategory,
              items: categories,
              // Untuk String, kita hanya perlu mengembalikan 'item' itu sendiri
              itemToString: (item) => item,
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              validator: (value) {
                if (value == null) return "Kategori wajib diisi";
                return null;
              },
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.indigo[600],
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),

                  hintText: "Search transactions...",
                  hintStyle: TextStyle(color: Colors.grey[600]),

                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              spacing: 25,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '12 Desember 2025',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                        Icons.arrow_circle_up,
                        size: 40,
                        color: Colors.green,
                      ),
                      title: 'Bonus Lembur',
                      description: 'Ini Contoh Desctiption',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '12 Desember 2025',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                        Icons.arrow_circle_up,
                        size: 40,
                        color: Colors.green,
                      ),
                      title: 'Bonus Lembur',
                      description: 'Ini Contoh Desctiption',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '12 Desember 2025',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                        Icons.arrow_circle_up,
                        size: 40,
                        color: Colors.green,
                      ),
                      title: 'Bonus Lembur',
                      description: 'Ini Contoh Desctiption',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

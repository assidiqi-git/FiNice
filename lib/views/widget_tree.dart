import 'package:finice/data/notifiers.dart';
import 'package:finice/views/pages/activity_page.dart';
import 'package:finice/views/pages/add_activity_page.dart';
import 'package:finice/views/pages/category_page.dart';
import 'package:finice/views/pages/home_page.dart';
import 'package:finice/views/pages/profile_page.dart';
import 'package:finice/views/widget/navbar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  HomePage(),
  ActivityPage(),
  HomePage(),
  CategoryPage(),
  ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: selectedPageTitleNotifier,
          builder: (context, value, child) {
            return Text(
              'Finice',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[300],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            tooltip: 'Tambah Transaksi',
            // hoverElevation: 10,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddActivityPage();
                  },
                ),
              );
            },
            backgroundColor: Colors.indigo, // Sesuaikan warnanya
            elevation: 3.0,
            shape: CircleBorder(),
            child: Icon(Icons.add, size: 40, color: Colors.white),
          ),
        ),
      ),

      // 2. Posisi Tombol
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}

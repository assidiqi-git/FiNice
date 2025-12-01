import 'package:finice/views/pages/activity_page.dart';
import 'package:finice/views/pages/category_page.dart';
import 'package:finice/views/pages/home_page.dart';
import 'package:finice/views/pages/profile_page.dart';
import 'package:finice/views/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<Widget> pages = [
  HomePage(),
  ActivityPage(),
  HomePage(),
  CategoryPage(),
  ProfilePage(),
];

class Mainscaffoldshell extends StatelessWidget {
  const Mainscaffoldshell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Finice';
      case 1:
        return 'Activity';
      case 2:
        return 'Category';
      case 3:
        return 'Profile';
      default:
        return 'Finice';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getPageTitle(navigationShell.currentIndex),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[300],
      ),
      body: navigationShell,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            tooltip: 'Tambah Transaksi',
            // hoverElevation: 10,
            onPressed: () {
              context.pushNamed('add_activity');
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
      bottomNavigationBar: NavbarWidget(
        currentRouteIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      ),
    );
  }
}

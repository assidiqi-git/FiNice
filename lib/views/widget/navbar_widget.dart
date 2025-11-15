import 'package:finice/data/notifiers.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (BuildContext context, int selectedPage, Widget? child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Dashboard'),

            NavigationDestination(
              icon: Icon(Icons.format_list_numbered_sharp),
              label: 'Activity',
            ),
            NavigationDestination(
              enabled: false,
              icon: Icon(Icons.circle, color: Colors.transparent),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmarks),
              label: 'Category',
            ),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int index) {
            selectedPageNotifier.value = index;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}

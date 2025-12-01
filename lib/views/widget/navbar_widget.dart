import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({
    super.key,
    required this.currentRouteIndex,
    required this.onDestinationSelected,
  });

  final int currentRouteIndex;
  final Function(int) onDestinationSelected;

  int _getVisualIndex(int routerIndex) {
    return routerIndex >= 2 ? routerIndex + 1 : routerIndex;
  }

  @override
  Widget build(BuildContext context) {
    final visualIndex = _getVisualIndex(currentRouteIndex);

    return NavigationBar(
      selectedIndex: visualIndex,
      onDestinationSelected: (int index) {
        // abaikan aksi jika user memilih index 2
        // index 2 kosong karena diganti dengan FloatingActionButton
        if (index == 2) return;

        // mengembalikan nilai index saat memilih menu
        final targetRouterIndex = index > 2 ? index - 1 : index;
        onDestinationSelected(targetRouterIndex);
      },
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
        NavigationDestination(icon: Icon(Icons.bookmarks), label: 'Category'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

import 'package:amor/screens/home_screen.dart';
import 'package:amor/screens/profile_screen.dart';
import 'package:amor/screens/save_screen.dart';
import 'package:amor/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../models/menu_item.dart';
import '../models/menu_page.dart';

class StyleDrawer extends StatefulWidget {
  const StyleDrawer({super.key});

  @override
  State<StyleDrawer> createState() => _StyleDrawerState();
}

class _StyleDrawerState extends State<StyleDrawer> {
  MenuItem currentItem = MenuItems.home;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        style: DrawerStyle.style2,
        borderRadius: 30,
        slideWidth: MediaQuery.of(context).size.width * 0.5,
        showShadow: true,
        menuBackgroundColor: const Color.fromARGB(255, 211, 245, 227),
        mainScreen: getScreen(),
        menuScreen: Builder(builder: (context) {
          return MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            },
          );
        }));
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomeScreen();
      case MenuItems.saved:
        return const SaveScreen(
          searchString: "",
        );
      case MenuItems.search:
        return const SearchScreen(
          searchString: "",
        );
      case MenuItems.profile:
      default:
        return ProfileScreen();
    }
  }
}

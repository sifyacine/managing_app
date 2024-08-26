import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'features/screens/side_screen/navigation_menu.dart';
import 'features/screens/side_screen/side_screen.dart';
import 'features/screens/side_screen/widgets/icons_side.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // DrawerMenu: 15% of the total width
            Container(
              width: screenWidth * 0.08,
              child: const DrawerMenu(),
            ),
            // NavigationTabBar: 45% of the total width
            Container(
              width: screenWidth * 0.64,
              child: const NavigationTabBar(),
            ),
            // Third Container: 40% of the total width
            Container(
              width: screenWidth * 0.26,
              child: NavigationMenu(),
            ),
            Container(
              width: screenWidth * 0.02,
              child: IconsSide(),
            ),

          ],
        ),
      ),
    );
  }
}



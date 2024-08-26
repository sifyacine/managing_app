import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'features/screens/food/food_page.dart';
import 'utils/constants/colors.dart';

// Assume this class is defined elsewhere and imported accordingly
class MyTabBarController extends GetxController {
  late TabController tabController;
  List<Widget> screens = []; // Define your screens here

  MyTabBarController(TickerProvider vsync) {
    tabController = TabController(length: 5, vsync: vsync);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

// NavigationTabBar widget
class NavigationTabBar extends StatefulWidget {
  const NavigationTabBar({Key? key}) : super(key: key);

  @override
  _NavigationTabBarState createState() => _NavigationTabBarState();
}

class _NavigationTabBarState extends State<NavigationTabBar> with SingleTickerProviderStateMixin {
  late MyTabBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(MyTabBarController(this));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Bar with TabBar and Search
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Tab Bar
              Expanded(
                child: SizedBox(
                  height: 60, // Adjust the height as necessary
                  child: TabBar(
                    controller: _controller.tabController,
                    isScrollable: true,
                    indicator: CustomTabIndicator(), // Use custom indicator
                    labelPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    labelColor: TColors.primaryColor,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      buildTab('Categories', Iconsax.home),
                      buildTab('Food', Iconsax.cake),
                      buildTab('Favored', Iconsax.heart),
                      buildTab('Drinks', Iconsax.coffee),
                      buildTab('Side Items', Iconsax.milk),
                    ],
                  ),
                ),
              ),
              // Search Bar
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: 200,
                  child: SearchBar(),
                ),
              ),
            ],
          ),
        ),
        // Content Area
        Expanded(
          child: TabBarView(
            controller: _controller.tabController,
            children: _controller.screens,
          ),
        ),
      ],
    );
  }

  Widget buildTab(String text, IconData icon) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search...',
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}


class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(onChanged);
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  _CustomTabIndicatorPainter(VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = Colors.orange[100]! // Background color
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.orange // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1; // Set to 1 to have a visible border

    // Update these constants as needed to fit your design
    const double indicatorWidth = 90;
    const double indicatorHeight = 50;
    const double borderRadius = 12;

    // Calculate the position of the indicator based on the current tab
    final Rect rect = Offset(
      offset.dx + configuration.size!.width / 2 - indicatorWidth / 2,
      configuration.size!.height - indicatorHeight,
    ) &
    const Size(indicatorWidth, indicatorHeight);

    final RRect rRect = RRect.fromRectAndRadius(rect, const Radius.circular(borderRadius));

    canvas.drawRRect(rRect, paint);
    canvas.drawRRect(rRect, borderPaint); // Draw border
  }
}



// Controller class for managing navigation state
class MyDrawerController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}


class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyDrawerController());
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header with Logo
          Container(
            width: double.infinity,
            child: Center(
              child: Image.asset(
                'assets/logo/logo.png', // Replace with your logo asset path
                width: 80, // Adjust logo width as needed
                height: 80, // Adjust logo height as needed
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Divider between the header and menu items
          const Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
          // Wrap the drawer tiles with an Expanded widget containing a SingleChildScrollView
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerTile(
                    icon: Iconsax.bag,
                    label: 'Orders',
                    count: 10,
                    onTap: () {
                      controller.selectedIndex.value = 0;
                      
                    },
                    showLabel: screenWidth >= 800,
                  ),
                  DrawerTile(
                    icon: Iconsax.shop,
                    label: 'Tables',
                    count: 0,
                    onTap: () {
                      controller.selectedIndex.value = 1;
                    },
                    showLabel: screenWidth >= 800,
                  ),
                  DrawerTile(
                    icon: Iconsax.call,
                    label: 'Call Center',
                    count: 0,
                    onTap: () {
                      controller.selectedIndex.value = 2;
                    },
                    showLabel: screenWidth >= 800,
                  ),
                  DrawerTile(
                    icon: Iconsax.car,
                    label: 'Delivery',
                    count: 0,
                    onTap: () {
                      controller.selectedIndex.value = 3;
                    },
                    showLabel: screenWidth >= 800,
                  ),

                  DrawerTile(
                    icon: Iconsax.setting,
                    label: 'Settings',
                    count: 0,
                    onTap: () {
                      controller.selectedIndex.value = 3;
                    },
                    showLabel: screenWidth >= 800,
                  ),
                  DrawerTile(
                    icon: Iconsax.money,
                    label: 'Quick End',
                    count: 0,
                    onTap: () {
                      controller.selectedIndex.value = 3;
                    },
                    showLabel: screenWidth >= 800,
                  ),
                  DrawerTile(
                    icon: Iconsax.pause,
                    label: 'Shift Off',
                    count: 0,
                    onTap: () {
                      controller.selectedIndex.value = 4;
                    },
                    showLabel: screenWidth >= 800,
                  ),
                  DrawerTile(
                    icon: Iconsax.logout,
                    label: 'Power Off',
                    count: 0,
                    onTap: () {
                      // Handle logout
                    },
                    showLabel: screenWidth >= 800,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final VoidCallback onTap;
  final bool showLabel;

  const DrawerTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.count,
    required this.onTap,
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 14.0),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Icon(icon, size: 24), // Main icon
              if (count > 0)
                Positioned(
                  right: 0, // Adjust this value to position the badge correctly
                  top: 0, // Adjust this value to position the badge correctly
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (showLabel) // Show the label only if the screen width is greater than 600
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10.0, // Smaller text size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
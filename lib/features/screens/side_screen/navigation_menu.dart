import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:managing_app/features/screens/side_screen/side_screen.dart';
import 'package:managing_app/features/screens/side_screen/widgets/show_dialog.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
            () => Container(
          color: isDark ? TColors.dark : TColors.light,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Iconsax.undo, 0, controller),
              _buildNavItem(Iconsax.unlock, 1, controller),
              _buildNavItem(Iconsax.heart, 2, controller),
              _buildNavItem(Iconsax.user, 3, controller),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildNavItem(IconData icon, int index, NavigationController controller) {
    final bool isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange.shade100, // Background color for selected item
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          Icon(
            icon,
            color: isSelected ? Colors.orange : Colors.grey, // Icon color change
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [Container(), CustomDialog(), const SideScreen(), Container()];
}

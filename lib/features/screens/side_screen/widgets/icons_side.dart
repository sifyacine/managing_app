import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IconsSide extends StatelessWidget {
  const IconsSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 11 IconButtons
            IconButton(
              icon: const Icon(Icons.star, size: 12), // Icon size set to 12
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.location, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.clock, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.percentage_circle, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.group, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.star, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.star, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.chart_square, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.printer, size: 12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.chart_square, size: 12),
              onPressed: () {},
            ),
            const SizedBox(height: 8), // Space between sets of IconButtons

            // 3 IconButtons in a Row
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.filter_1, size: 12),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.filter_2, size: 12),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.filter_3, size: 12),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8), // Space before Column

            // 3 IconButtons in a Column
            Column(
              children: [
                IconButton(
                  icon: const Icon(Iconsax.flash_1, size: 12),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Iconsax.unlock, size: 12),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Iconsax.wifi, size: 12),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


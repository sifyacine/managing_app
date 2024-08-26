import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart'; // Import for TColors
import '../../../utils/helpers/helper_functions.dart'; // Import for THelperFunctions

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final textColor = isDark ? Colors.white : Colors.black;
    final backgroundColor = isDark ? TColors.dark : Colors.white;
    final priceTextColor = isDark ? Colors.grey[300] : Colors.grey[700];

    return Card(
      color: backgroundColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Price: DZD ${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: priceTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

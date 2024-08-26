import 'package:flutter/material.dart';
import '../../../common/products/product_card.dart';
import '../../../utils/constants/colors.dart';
import '../../models/products/prooducts model.dart';
import '../../../utils/helpers/helper_functions.dart'; // Import the helper function for dark mode

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 8, // Number of tabs
      child: Scaffold(
        backgroundColor: isDark ? Colors.grey[850] : Colors.grey[200], // Adjust background color for dark mode
        appBar: AppBar(
          backgroundColor: isDark ? Colors.grey[850] : Colors.grey[200], // Adjust app bar background for dark mode
          elevation: 0, // Remove the shadow of the app bar
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight), // Height of the TabBar
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.white, // Adjust TabBar container color for dark mode
                  borderRadius: BorderRadius.circular(8), // Correct border radius
                ),
                child: TabBar(
                  isScrollable: true, // Allows horizontal scrolling of tabs if they overflow
                  tabs: const [
                    Text("Daily Breakfast", style: TextStyle(fontSize: 14)),
                    Text("Special Offers", style: TextStyle(fontSize: 14)),
                    Text("Soup and Appetizers", style: TextStyle(fontSize: 14)),
                    Text("Salad", style: TextStyle(fontSize: 14)),
                    Text("Grills Meat by Kilo", style: TextStyle(fontSize: 14)),
                    Text("Grills Meat Meal", style: TextStyle(fontSize: 14)),
                    Text("Smoked Meat Meal", style: TextStyle(fontSize: 14)),
                    Text("Grilled Chicken", style: TextStyle(fontSize: 14)),
                  ],
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  indicator: CustomTabIndicator(), // Use custom indicator
                  labelColor: isDark ? Colors.white : Colors.black, // Adjust label color based on dark mode
                  unselectedLabelColor: isDark ? Colors.grey[500] : Colors.black, // Adjust unselected label color for dark mode
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildProductGrid(),
            _buildProductGrid(),
            _buildProductGrid(),
            _buildProductGrid(),
            _buildProductGrid(),
            _buildProductGrid(),
            _buildProductGrid(),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Get the screen width
          final screenWidth = constraints.maxWidth;

          // Determine the number of columns based on screen width
          int crossAxisCount;
          if (screenWidth < 400) {
            crossAxisCount = 2; // Small screens
          } else if (screenWidth < 700) {
            crossAxisCount = 3; // Medium screens
          } else if (screenWidth < 800) {
            crossAxisCount = 4; // Large screens
          } else {
            crossAxisCount = 5; // Extra-large screens
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
              childAspectRatio: 0.7, // Adjust ratio to fit your design
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                imageUrl: product.imageUrl,
                productName: product.productName,
                price: product.price,
              );
            },
          );
        },
      ),
    );
  }
}

final List<Product> products = [
  Product(
    imageUrl: 'assets/images/desserts/Brownie Sundae.jpg',
    productName: 'Breakfast Burrito',
    price: 1200.0,
  ),
  Product(
    imageUrl: 'assets/images/desserts/Apple Pie.jpg',
    productName: 'Pancakes',
    price: 800.0,
  ),
  Product(
    imageUrl: 'assets/images/burgers/Veggie Delight Burger.jpg',
    productName: 'French Toast',
    price: 1000.0,
  ),
  Product(
    imageUrl: 'assets/images/burgers/Spicy Chicken Burger.jpg',
    productName: 'Omelette',
    price: 950.0,
  ),
  Product(
    imageUrl: 'assets/images/burgers/Double Decker Burger.jpg',
    productName: 'Fruit Salad',
    price: 700.0,
  ),
  Product(
    imageUrl: 'assets/images/burgers/Classic cheese burger.jpg',
    productName: 'Smoothie',
    price: 650.0,
  ),
  Product(
    imageUrl: 'assets/images/burgers/Classic cheese burger.jpg',
    productName: 'Bagel with Cream Cheese',
    price: 850.0,
  ),
];

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
      ..color = TColors.primaryColor // Background color
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = TColors.primaryColor // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1; // Border width

    // Define margin around the indicator
    const double margin = 4.0;
    const double indicatorHeight = 50;
    const double borderRadius = 8;

    // Calculate text width using TextPainter
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'Sample Text', // Use a default sample text
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    )
      ..layout(); // Layout the text

    // Use the text width to determine the indicator width
    final double textWidth = textPainter.width;
    final double indicatorWidth = textWidth + 2 * margin;

    final Rect rect = Offset(
      offset.dx + configuration.size!.width / 2 - indicatorWidth / 2,
      configuration.size!.height - indicatorHeight + margin,
    ) &
    Size(indicatorWidth, indicatorHeight - margin);

    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    canvas.drawRRect(rRect, paint);
    canvas.drawRRect(rRect, borderPaint); // Draw border
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 50, // Increased height for better visibility
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.user, size: 24, color: isDarkMode ? Colors.white : Colors.black),
                    Text(
                      "4",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0, // Font size for better visibility
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8.0), // Space between containers
            Expanded(
              flex: 6,
              child: Container(
                height: 50, // Consistent height with the first container
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Upper part
                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[600] : Colors.grey[300], // Adjusted color for the upper part
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12), // Radius for top-left corner
                          topRight: Radius.circular(12), // Radius for top-right corner
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, size: 12, color: isDarkMode ? Colors.purpleAccent : Colors.purple),
                              SizedBox(width: 8.0),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: isDarkMode ? Colors.purpleAccent : Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 12, color: isDarkMode ? Colors.purpleAccent : Colors.purple),
                              SizedBox(width: 8.0),
                              Icon(Icons.email, size: 12, color: isDarkMode ? Colors.purpleAccent : Colors.purple),
                              SizedBox(width: 8.0),
                              Icon(Icons.message, size: 12, color: isDarkMode ? Colors.purpleAccent : Colors.purple),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Lower part
                    Expanded(
                      child: Container(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200], // Adjusted color for the lower part
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'by John Doe',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

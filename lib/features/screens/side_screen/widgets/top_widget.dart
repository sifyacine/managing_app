import 'package:flutter/material.dart';
import 'package:managing_app/features/screens/side_screen/widgets/show_dialog.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current theme
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Enable vertical scrolling
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.star,
                      size: 30,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'C10',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '#123456',
                          style: TextStyle(
                            fontSize: 10,
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            Text(
                              '8.09',
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ready on',
                              style: TextStyle(
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              child: const Text(
                                '50 min',
                                style: TextStyle(color: Colors.white, fontSize: 8.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog();
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.red[700] : Colors.red[100],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/icons/red_X_icon.png', // Replace with your image asset
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

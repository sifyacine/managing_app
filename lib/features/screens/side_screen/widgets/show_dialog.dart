import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                // This Container will act as the blurred background
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: MediaQuery.of(context).size.width * 0.25, // Adjust width as needed
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
                // Content of the dialog
                Positioned.fill(
                  left: MediaQuery.of(context).size.width * 0.25, // Adjust to account for the side screen
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lock, size: 50),
                        const SizedBox(height: 10),
                        const Text(
                          '15:16',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Abdessamed Bouazza',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[200],
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Iconsax.undo),
                                label: const Text('Return'),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  // Add your unlock functionality here
                                },
                                icon: const Icon(Iconsax.unlock, color: Colors.green),
                                label: const Text('Unlock', style: TextStyle(color: Colors.green)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

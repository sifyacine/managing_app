import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.user, size: 24, color: Colors.black),
                    Text(
                      "4",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0, // Font size for better visibility
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
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Upper part
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, size: 12, color: Colors.purple),
                              SizedBox(width: 8.0),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 12, color: Colors.purple),
                              SizedBox(width: 8.0),
                              Icon(Icons.email, size: 12, color: Colors.purple),
                              SizedBox(width: 8.0),
                              Icon(Icons.message, size: 12, color: Colors.purple),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Lower part
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'by John Doe',
                          style: TextStyle(
                            fontSize: 12,
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

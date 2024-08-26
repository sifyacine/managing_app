import 'package:flutter/material.dart';

class OrdersCard extends StatefulWidget {
  final String quantity; // Example: '10' or '3.5'
  final String unit; // Example: 'pcs' or 'kg'
  final String name; // Name of the item or order
  final String address; // Address for the order
  final String price; // Price of the order

  const OrdersCard({
    Key? key,
    required this.quantity,
    required this.unit,
    required this.name,
    required this.address,
    required this.price,
  }) : super(key: key);

  @override
  _OrdersCardState createState() => _OrdersCardState();
}

class _OrdersCardState extends State<OrdersCard> {
  double _dragPosition = 0.0; // Tracks the drag position

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _dragPosition += details.delta.dx;
          _dragPosition = _dragPosition.clamp(-160.0, 160.0); // Adjust the clamp values as needed
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          if (_dragPosition > 50) {
            _dragPosition = 160; // Action threshold for right swipe
            print('Right swipe action triggered'); // Replace with actual action
          } else if (_dragPosition < -50) {
            _dragPosition = -160; // Action threshold for left swipe
            print('Left swipe action triggered'); // Replace with actual action
          } else {
            _dragPosition = 0; // Return to original position
          }
        });
      },
      child: Stack(
        children: [
          // Background action for swipe right
          if (_dragPosition > 0) Positioned(
            left: 0,
            right: _dragPosition,
            child: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  print('Delete action triggered');
                },
              ),
            ),
          ),
          // Background action for swipe left
          if (_dragPosition < 0) Positioned(
            left: -_dragPosition,
            right: 0,
            child: Container(
              color: Colors.purple,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      print('Edit action triggered');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.white),
                    onPressed: () {
                      print('Share action triggered');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.info, color: Colors.white),
                    onPressed: () {
                      print('Info action triggered');
                    },
                  ),
                ],
              ),
            ),
          ),
          // Foreground content
          Transform.translate(
            offset: Offset(_dragPosition, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container with quantity text and border
                  Container(
                    width: 60,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.orange,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: Text(
                            widget.quantity,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          bottom: -8,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              color: Colors.white,
                              child: Text(
                                widget.unit,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -5,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              color: Colors.white,
                              child: const Text(
                                'x',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.address,
                                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              widget.price,
                              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
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

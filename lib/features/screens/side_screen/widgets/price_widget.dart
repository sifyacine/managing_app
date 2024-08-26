import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Not paid",
              style: TextStyle(color: Colors.white, fontSize: 12),

            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "10%",
                  style: TextStyle(color: Colors.white, fontSize: 12),

                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text(
                  "2800",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text(
                  "2620",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

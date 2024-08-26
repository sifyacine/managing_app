import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("subtotale"),
                Text("2000", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text("suervice"),
                    Text("175", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    Text("sdelivery"),
                    Text("175", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(width: 10.0),

                Column(
                  children: [
                    Text("vat"),
                    Text("200", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

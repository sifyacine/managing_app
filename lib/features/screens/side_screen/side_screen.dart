import 'package:flutter/material.dart';
import 'package:managing_app/features/screens/side_screen/widgets/price_widget.dart';
import 'package:managing_app/features/screens/side_screen/widgets/service_widget.dart';
import 'package:managing_app/features/screens/side_screen/widgets/top_widget.dart';

import 'widgets/contact_widget.dart';
import 'widgets/orders_widget.dart';

class SideScreen extends StatelessWidget {
  const SideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Expanded(flex: 1, child: CustomCardWidget()),
              Expanded(flex: 1, child: ContactWidget()),
              Expanded(flex: 6, child: OrdersWidget()),
              Expanded(flex: 1, child: ServiceWidget()),
              Expanded(flex: 1, child: PriceWidget()),
            ],
          ),
        ),
      ],
    );
  }
}

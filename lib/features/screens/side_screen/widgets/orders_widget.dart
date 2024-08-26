import 'package:flutter/material.dart';

import '../../../../common/orders/orders_card.dart';
import '../../../models/orders/orders_model.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: exampleOrders.map((order) => OrdersCard(
            quantity: order.quantity,
            unit: order.unit,
            name: order.name,
            address: order.address,
            price: order.price,
          )).toList(),
        ),
      ),
    );
  }
}

List<Order> exampleOrders = [
  Order(
    quantity: '10',
    unit: 'pcs',
    name: 'Order Name 1',
    address: '123 Example Street',
    price: '\$15.99',
  ),
  Order(
    quantity: '3.5',
    unit: 'kg',
    name: 'Order Name 2',
    address: '456 Another Ave',
    price: '\$25.49',
  ),
  Order(
    quantity: '20',
    unit: 'pcs',
    name: 'Order Name 3',
    address: '789 Some Road',
    price: '\$30.00',
  ),
  Order(
    quantity: '1.2',
    unit: 'kg',
    name: 'Order Name 4',
    address: '101 Different Blvd',
    price: '\$10.75',
  ),
  Order(
    quantity: '10',
    unit: 'pcs',
    name: 'Order Name 1',
    address: '123 Example Street',
    price: '\$15.99',
  ),
  Order(
    quantity: '10',
    unit: 'pcs',
    name: 'Order Name 1',
    address: '123 Example Street',
    price: '\$15.99',
  ),
  Order(
    quantity: '10',
    unit: 'pcs',
    name: 'Order Name 1',
    address: '123 Example Street',
    price: '\$15.99',
  ),
  Order(
    quantity: '10',
    unit: 'pcs',
    name: 'Order Name 1',
    address: '123 Example Street',
    price: '\$15.99',
  ),
  // Add more example orders as needed
];

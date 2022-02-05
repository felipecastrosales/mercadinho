import 'package:flutter/material.dart';

import 'package:mercadinho/src/models/order_model.dart';
import 'package:mercadinho/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderModel order;
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDataTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          children: [],
        ),
      ),
    );
  }
}

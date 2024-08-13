import 'package:flutter/material.dart';

import 'package:mercadinho/src/models/cart_item_model.dart';
import 'package:mercadinho/src/models/order_model.dart';
import 'package:mercadinho/src/pages/commom_widgets/payment_dialog.dart';
import 'package:mercadinho/src/services/utils_services.dart';
import 'order_status_widget.dart';

class OrderTile extends StatelessWidget {
  OrderTile({
    super.key,
    required this.order,
  });
  final OrderModel order;
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
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
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(order: order);
                    },
                  );
                },
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 18,
                  color: Colors.green[100],
                ),
                label: Text(
                  'View QRCode PIX',
                  style: TextStyle(
                    color: Colors.green[100],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    required this.orderItem,
    required this.utilsServices,
  });

  final CartItemModel orderItem;
  final UtilsServices utilsServices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${orderItem.quantity} x ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
            ),
          ),
          Text(
            utilsServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}

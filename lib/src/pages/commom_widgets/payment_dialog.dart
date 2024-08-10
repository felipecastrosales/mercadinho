import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:mercadinho/src/services/utils_services.dart';
import 'package:mercadinho/src/models/order_model.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({
    super.key,
    required this.order,
  });

  final OrderModel order;
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Payment with PIX',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                QrImageView(
                  data: 'qfghuji34789oy',
                  version: QrVersions.auto,
                  size: 200,
                ),
                Text(
                  'Due date: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy,
                    size: 16,
                  ),
                  label: Text(
                    'Copy PIX Code',
                    style: TextStyle(color: Colors.green[800]),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

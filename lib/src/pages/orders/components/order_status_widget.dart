import 'package:flutter/material.dart';
import 'package:mercadinho/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  OrderStatusWidget({
    super.key,
    required this.status,
    required this.isOverdue,
  });

  final String status;
  final bool isOverdue;
  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };
  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          title: 'Payment confirmed',
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix reversed',
            backgroundColor: Colors.orange,
          ),
          const _CustomDivider(),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix not exists',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: 'Payment',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: 'Preparing',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            title: 'Sending',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus == 5,
            title: 'Delivered',
          ),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({
    required this.isActive,
    required this.title,
    this.backgroundColor,
  });

  final bool isActive;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 12,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

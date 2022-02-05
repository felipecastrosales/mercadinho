import 'package:flutter/material.dart';
import 'package:mercadinho/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);
  final String status;
  final bool isOverdue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _StatusDot(
          title: 'Payment test',
          isActive: true,
        ),
        _StatusDot(
          title: 'Payment ok',
          isActive: false,
        ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
  }) : super(key: key);
  final bool isActive;
  final String title;

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
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
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
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

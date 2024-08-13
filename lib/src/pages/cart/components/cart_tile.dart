import 'package:flutter/material.dart';

import 'package:mercadinho/src/config/custom_colors.dart';
import 'package:mercadinho/src/models/cart_item_model.dart';
import 'package:mercadinho/src/pages/commom_widgets/quantity_widget.dart';
import 'package:mercadinho/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    super.key,
    required this.cartItem,
    required this.remove,
  });

  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(
            widget.cartItem.totalPrice(),
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColors.customSwatchColor,
          ),
        ),
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (widget.cartItem.quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}

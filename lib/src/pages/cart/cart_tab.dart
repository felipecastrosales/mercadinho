import 'package:flutter/material.dart';

import 'package:mercadinho/src/config/app_data.dart' as appData;
import 'package:mercadinho/src/config/custom_colors.dart';
import 'package:mercadinho/src/models/cart_item_model.dart';
import 'package:mercadinho/src/services/utils_services.dart';
import 'components/cart_tile.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final utilsServices = UtilsServices();
  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0.0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(
                    cartTotalPrice(),
                  ),
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      // ignore: avoid_print
                      print(result);
                    },
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      primary: CustomColors.customSwatchColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Order Confirmation'),
        content: const Text('Are you sure you want to checkout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              primary: CustomColors.customSwatchColor,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}

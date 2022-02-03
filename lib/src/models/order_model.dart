import 'package:mercadinho/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDataTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdDataTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}

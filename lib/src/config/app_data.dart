import 'package:mercadinho/src/models/cart_item_model.dart';
import 'package:mercadinho/src/models/item_model.dart';
import 'package:mercadinho/src/models/order_model.dart';
import 'package:mercadinho/src/models/user_model.dart';

ItemModel apple = ItemModel(
  itemName: 'Apple',
  description:
      'The best apple in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
  imgUrl: 'assets/fruits/apple.png',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  itemName: 'Grape',
  description:
      'The best grape in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
  imgUrl: 'assets/fruits/grape.png',
  price: 7.4,
  unit: 'kg',
);

ItemModel guava = ItemModel(
  itemName: 'Guava',
  description:
      'The best guava in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
  imgUrl: 'assets/fruits/guava.png',
  price: 11.5,
  unit: 'kg',
);

ItemModel kiwi = ItemModel(
  itemName: 'Kiwi',
  description:
      'The best kiwi in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
  imgUrl: 'assets/fruits/kiwi.png',
  price: 2.5,
  unit: 'un',
);

ItemModel mango = ItemModel(
  itemName: 'Mango',
  description:
      'The best mango in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
  imgUrl: 'assets/fruits/mango.png',
  price: 2.5,
  unit: 'un',
);

ItemModel papaya = ItemModel(
  itemName: 'Papaya',
  description:
      'The best papaya in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
  imgUrl: 'assets/fruits/papaya.png',
  price: 8,
  unit: 'kg',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Fruits',
  'Dairy',
  'Vegetable',
  'Cereals',
  'Meat',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 2,
  ),
  CartItemModel(
    item: mango,
    quantity: 3,
  ),
  CartItemModel(
    item: papaya,
    quantity: 5,
  ),
  CartItemModel(
    item: guava,
    quantity: 5,
  ),
];

UserModel user = UserModel(
  name: 'Luis Felipe de Castro Sales',
  email: 'soufeliposales@gmail.com',
  phone: '55 85 9876-1234',
  cpf: '123.456.789.10',
  password: '123456',
);

List<OrderModel> orders = [
  OrderModel(
    id: 'assd45sa452azxd1',
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 3,
      ),
    ],
    status: 'pending_payment',
    total: 11.0,
    copyAndPaste: '25424527',
    createdDataTime: DateTime.parse('2022-06-08 10:00:10.458'),
    overdueDateTime: DateTime.parse('2022-06-10 10:00:10.458'),
  ),
  OrderModel(
    id: 'xzcrtre5446sad1',
    items: [
      CartItemModel(
        item: papaya,
        quantity: 2,
      ),
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
    status: 'pending_payment',
    total: 19.5,
    copyAndPaste: '4537838542',
    createdDataTime: DateTime.parse('2022-05-08 10:00:10.458'),
    overdueDateTime: DateTime.parse('2022-05-10 10:00:10.458'),
  ),
];

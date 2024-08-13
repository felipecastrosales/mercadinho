import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';

import 'package:mercadinho/src/config/app_data.dart' as appData;
import 'package:mercadinho/src/config/custom_colors.dart';
import 'package:mercadinho/src/pages/home/components/category_tile.dart';
import 'package:mercadinho/src/pages/home/components/item_tile.dart';
import 'package:mercadinho/src/services/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Fruits';
  final utilsServices = UtilsServices();

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  Future<void> listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 32,
      width: 32,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 2),
              child: GestureDetector(
                onTap: () {},
                child: AddToCartIcon(
                  key: cartKey,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                  badgeOptions: const BadgeOptions(
                    active: true,
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ),
          ],
          title: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Green',
                  style: TextStyle(
                    color: CustomColors.customSwatchColor,
                  ),
                ),
                TextSpan(
                  text: 'grocer',
                  style: TextStyle(
                    color: CustomColors.customContrastColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  labelText: 'Search here...',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 24),
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: appData.categories.length,
                separatorBuilder: (_, index) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  final category = appData.categories[index];

                  return CategoryTile(
                    category: category,
                    isSelected: category == selectedCategory,
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                itemCount: appData.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 9 / 11.5,
                ),
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: appData.items[index],
                    onClick: listClick,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

import 'package:mercadinho/src/config/custom_colors.dart';
import 'package:mercadinho/src/config/app_data.dart' as appData;
import 'components/category_tile.dart';
import 'components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Fruits';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 14, right: 14),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                badgeColor: CustomColors.customContrastColor,
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
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
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                  onTap: () {
                    setState(() {
                      selectedCategory = appData.categories[index];
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
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemBuilder: (_, index) {
                return ItemTile(
                  item: appData.items[index]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

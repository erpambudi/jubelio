import 'package:flutter/material.dart';
import 'package:jubelio/common/constants/app_images.dart';
import 'package:jubelio/common/constants/app_values.dart';
import 'package:jubelio/common/styles/app_colors.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/presentation/main/widgets/result_state_view.dart';
import 'package:jubelio/presentation/product/widgets/product_tile.dart';

class SearchProductPage extends StatefulWidget {
  static const routeName = "/search-product";
  final List<Product> products;

  const SearchProductPage({required this.products, super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  List<Product> foundProducts = [];

  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.products;
    } else {
      results = widget.products
          .where((product) => product.name!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProducts = results;
    });
  }

  @override
  void initState() {
    super.initState();
    foundProducts.addAll(widget.products);
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search Products...',
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(14),
            child: SizedBox(
              width: 18,
              height: 18,
              child: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 80,
        title: _searchBar(),
      ),
      body: Builder(
        builder: (context) {
          if (foundProducts.isNotEmpty) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                final item = foundProducts[index];

                return Container(
                  margin: EdgeInsets.only(
                    top: item == foundProducts.first ? AppValues.margin : 0,
                    bottom: item == foundProducts.last
                        ? AppValues.margin
                        : AppValues.margin_12,
                  ),
                  child: ProductTile(
                    product: foundProducts[index],
                  ),
                );
              }),
              itemCount: foundProducts.length,
            );
          } else {
            return const ResultStateView(
              AppImages.emptyData,
              "No Product Found",
            );
          }
        },
      ),
    );
  }
}

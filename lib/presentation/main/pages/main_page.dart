import 'package:flutter/material.dart';
import 'package:jubelio/common/constants/app_icons.dart';
import 'package:jubelio/common/styles/app_colors.dart';
import 'package:jubelio/presentation/cart/pages/cart_page.dart';
import 'package:jubelio/presentation/main/widgets/navbar_item.dart';
import 'package:jubelio/presentation/product/pages/products_page.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      label: 'Products',
      icon: IconNavBar(
        iconPath: AppIcons.homeUnactive,
      ),
      activeIcon: IconNavBar(
        iconPath: AppIcons.homeActive,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Cart',
      icon: IconNavBar(
        iconPath: AppIcons.whistlistUnactive,
      ),
      activeIcon: IconNavBar(
        iconPath: AppIcons.whistlistActive,
      ),
    ),
  ];

  final List<Widget> _pages = [
    const ProductsPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: _bottomNavBarItems,
        showSelectedLabels: true,
        selectedFontSize: 12,
        selectedItemColor: AppColors.brand,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        showUnselectedLabels: true,
        unselectedFontSize: 11,
        onTap: (selected) {
          setState(() {
            selectedIndex = selected;
          });
        },
      ),
    );
  }
}

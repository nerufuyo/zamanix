import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/constant.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) => onItemTapped(value),
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: AppTextStyle.caption,
      selectedItemColor: AppColor.textLight,
      unselectedLabelStyle: AppTextStyle.caption,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        bottomNavItems.length,
        (index) => BottomNavigationBarItem(
          backgroundColor: AppColor.transparent,
          icon: Image.asset(
            bottomNavItems[index]['logo'],
            width: 20,
            height: 20,
          ),
          activeIcon: Image.asset(
            bottomNavItems[index]['clickedLogo'],
            width: 20,
            height: 20,
          ),
          label: bottomNavItems[index]['label'],
        ),
      ),
    );
  }
}

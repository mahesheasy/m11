import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';

class BDENavBar extends StatelessWidget {
  const BDENavBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1C8C4C), Color(0xFF67B18A)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          selectedIconTheme: const IconThemeData(color: AppColors.green),
          items: [
            BottomNavigationBarItem(
              icon: _NavIconWidget(
                AppIcons.icHome.toWidget(
                  height: 32,
                  width: 32,
                  color: navigationShell.currentIndex == 0
                      ? AppColors.seaGrass
                      : AppColors.white,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _NavIconWidget(
                AppIcons.icFollowUp.toWidget(
                  height: 32,
                  width: 32,
                  color: navigationShell.currentIndex == 1
                      ? AppColors.seaGrass
                      : AppColors.white,
                ),
              ),
              label: 'Follow Ups',
            ),
            BottomNavigationBarItem(
              icon: _NavIconWidget(
                AppIcons.icReport.toWidget(
                  height: 32,
                  width: 32,
                  color: navigationShell.currentIndex == 2
                      ? AppColors.seaGrass
                      : AppColors.white,
                ),
              ),
              label: 'Report',
            ),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onTap(context, index),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _NavIconWidget extends StatelessWidget {
  const _NavIconWidget(this.child);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: AppColors.white,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.chlorophyll,
        child: Center(child: child),
      ),
    );
  }
}

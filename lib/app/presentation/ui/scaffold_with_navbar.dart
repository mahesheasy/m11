import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/ui/navbars/bde_nav_bar.dart';
import 'package:m11_ind/app/presentation/ui/navbars/ce_nav_bar.dart';
import 'package:m11_ind/app/presentation/ui/navbars/deo_nav_bar.dart';
import 'package:m11_ind/app/presentation/ui/navbars/fbo_nav_bar.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/model/logged_in_user.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (context.user.isDEO) ...[
            DEONavBar(navigationShell: navigationShell)
          ] else if (context.user.isCollExecutive) ...[
            CENavBar(navigationShell: navigationShell)
          ] else if (context.user.isBDE) ...[
            BDENavBar(navigationShell: navigationShell)
          ] else ...[
            FBONavBar(navigationShell: navigationShell)
          ],
        ],
      ),
    );
  }
}

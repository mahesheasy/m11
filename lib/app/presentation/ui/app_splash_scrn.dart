import 'package:flutter/material.dart';
import 'package:m11_ind/styles/icons.dart';

class AppSplashScrn extends StatelessWidget {
  const AppSplashScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppIcons.m11BgLogo.path)),
    );
  }
}

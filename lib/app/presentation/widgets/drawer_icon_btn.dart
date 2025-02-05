import 'package:flutter/material.dart';
import 'package:m11_ind/styles/app_colors.dart';

class DrawerIconBtn extends StatelessWidget {
  const DrawerIconBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 0),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          bottomLeft: Radius.circular(24.0),
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xff67B18A),
            Color(0xffC2FBDD),
            Color(0xff67B18A),
          ],
          stops: [0, 0.5, 1],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Container(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white, width: 0),
          borderRadius: const BorderRadius.all(
            Radius.circular(24.0),
          ),
          gradient: const RadialGradient(
            colors: [
              Color(0xffC2FBDD),
              Color(0xff88DCB0),
              Color(0xff67B18A),
            ],
          ),
        ),
        child: IconButton.outlined(
          icon: const Icon(
            Icons.settings_outlined,
            color: AppColors.white,
            size: 34,
          ),
          onPressed: Scaffold.of(context).openEndDrawer,
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0x12000000),
            side: const BorderSide(color: AppColors.white, width: 1.0),
          ),
        ),
      ),
    );
  }
}

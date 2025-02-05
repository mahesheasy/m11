import 'package:flutter/material.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UserRoleSelection extends StatelessWidget {
  const UserRoleSelection({
    super.key,
    required this.remaindDepot,
    required this.remaindCE,
  });

  final VoidCallback remaindDepot;
  final VoidCallback remaindCE;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 340),
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.carla,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SpacedColumn(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppButton(
                icon: const Icon(Icons.notifications, color: AppColors.white),
                bgColor: AppColors.liteRed,
                margin: const EdgeInsets.all(12),
                label: 'Remind Depot',
                onPressed: remaindDepot,
              ),
              AppButton(
                icon: const Icon(Icons.notifications, color: AppColors.white),
                bgColor: AppColors.liteRed,
                margin: const EdgeInsets.all(12),
                label: 'Remind CE',
                onPressed: remaindCE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

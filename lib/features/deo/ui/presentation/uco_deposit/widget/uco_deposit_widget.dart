import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/model/uco_deposit.dart';
import 'package:m11_ind/styles/app_colors.dart';

class UCODepositWidget extends StatelessWidget {
  const UCODepositWidget({super.key, required this.deposit});

  final UCODeposit deposit;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: ListTile(
        tileColor: const Color(0xFFFAF9F6),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: AppColors.grey)
        ),
        titleTextStyle: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        title: Text(deposit.fboName.valueOrEmpty),
        subtitle: Text(deposit.address.valueOrEmpty),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('\u{20B9} ${deposit.totalAmt.toString()}', 
              style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(deposit.totalWeight.toString()),
          ],
        ),
      ),
    );
  }
}
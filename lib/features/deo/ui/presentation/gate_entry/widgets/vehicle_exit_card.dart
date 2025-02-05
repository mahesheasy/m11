import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/model/gate_exit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/app_spacer.dart';

class VehicleExitCard extends StatelessWidget {
  const VehicleExitCard({
    super.key,
    required this.gateExits,
    required this.onTap,
  });

  final GateExit gateExits;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      child: Card(
        margin: EdgeInsets.zero,
        surfaceTintColor: AppColors.white,
        color: AppColors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.5, color: AppColors.green),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              title: Text(gateExits.gateExitNo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: DefaultTextStyle(
                style: TextStyles.titleSmall(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacer.p8(),
                    FittedBox(child: Text(gateExits.executive)),
                    Text('Vehicle Out Reading: ${gateExits.vehicleOutReading}'),
                  ],
                ),
              ),
              trailing: CircleAvatar(
                maxRadius: 24,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    Urls.filepath(gateExits.outReadingImage!),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
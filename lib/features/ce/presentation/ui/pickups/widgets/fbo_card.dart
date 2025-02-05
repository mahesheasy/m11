import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/bloc/location_distance/location_distance_cubit.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOCard extends StatelessWidget {
  const FBOCard({super.key, required this.fbo, required this.onTap});

  final FBO fbo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationDistanceCubit()..getDistance(fbo.latitude, fbo.longitude),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: AppColors.grey),
          ),
          color: fbo.isFollowUp ? AppColors.elote : AppColors.white,
          surfaceTintColor: AppColors.white,
          child: SpacedColumn(
            defaultHeight: 0,
            margin: const EdgeInsets.all(8.0),
            children: [
              ListTile(
                titleTextStyle: TextStyles.titleBold(context),
                subtitleTextStyle: context.textTheme.labelSmall
                    ?.copyWith(color: AppColors.black, height: 1),
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                minVerticalPadding: 0,
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(fbo.businessName),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.pin_drop),
                    CircleAvatar(
                      backgroundColor:
                          fbo.active ? AppColors.green : AppColors.red,
                      radius: 6,
                    ),
                  ],
                ),
                subtitle: BlocBuilder<LocationDistanceCubit, LocationDistanceState>(
                  builder: (_, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fbo.primaryAddress),
                        if (state.isSuccess) ...[
                          AppSpacer.p4(),
                          Text(state.distance.valueOrEmpty, style:const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ],
                    );
                  },
                ),
              ),
              AppSpacer.p8(),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const VerticalDivider(
                        thickness: 1, color: AppColors.green, width: 0),
                    Expanded(
                      child: FittedBox(
                        child: _BuyInfo(
                          title: 'Last Buy',
                          rate: Pair('Last Buying Rate : ', fbo.lastBuyPrice.toDouble()),
                          weight: Pair('Last Buying Weight : ', fbo.lastBuyWeight),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                        thickness: 1, color: AppColors.green, width: 0),
                    Expanded(
                      child: FittedBox(
                        child: _BuyInfo(
                          title: 'Average Buy',
                          rate: Pair('Avg. Buying Rate : ', fbo.avgPrice),
                          weight: Pair('Avg. Buying Weight : ', fbo.avgWeight),
                        ),
                      ),
                    ),
                    const VerticalDivider(thickness: 1, color: AppColors.green),
                  ],
                ),
              ),
              AppSpacer.p4(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last date of buy : ',
                          style: TextStyles.captionBold(context)),
                      if (fbo.lastBuyDate.containsValidValue) ...[
                        Text(
                          DFU.fromFrappeToddMMyyyy(fbo.lastBuyDate),
                          style: TextStyles.captionBold(context)
                              .copyWith(color: AppColors.red),
                        ),
                      ],
                    ],
                  ),
                  _BuyButton(
                    price: fbo.pricePerKg,
                    onPressed: onTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton({required this.onPressed, required this.price});

  final double price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        visualDensity: const VisualDensity(vertical: -2),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      onPressed: onPressed,
      child: Text(
        '₹ $price per kg',
        style: context.textTheme.labelLarge
            ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _BuyInfo extends StatelessWidget {
  const _BuyInfo({
    required this.title,
    required this.rate,
    required this.weight,
  });

  final String title;
  final Pair<String, double> rate;
  final Pair<String, double> weight;

  @override
  Widget build(BuildContext context) {
    final style =
        context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: style?.copyWith(color: AppColors.green), textAlign: TextAlign.center),
          _LabelValueWidget(pair: rate),
          _LabelValueWidget(pair: weight),
        ],
      ),
    );
  }
}

class _LabelValueWidget extends StatelessWidget {
  const _LabelValueWidget({required this.pair});

  final Pair<String, double> pair;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(pair.first, style: TextStyles.captionBold(context)),
        Text(pair.second.toStringAsFixed(2),
            style: TextStyles.captionBold(context)),
      ],
    );
  }
}

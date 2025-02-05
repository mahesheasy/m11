import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/bloc/location_distance/location_distance_cubit.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/model/logged_in_user.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/ce/models/fbo_summary.dart';
import 'package:m11_ind/features/ce/presentation/bloc/remind_fbo/remind_fbo_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/fbos/widgets/user_role_selection_widget.dart';
import 'package:m11_ind/features/deo/data/deo_api_helper.dart';
import 'package:m11_ind/features/deo/model/geo_loc_update.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:open_filex/open_filex.dart';

class FboSummaryWidget extends StatelessWidget {
  const FboSummaryWidget({
    super.key,
    required this.summary,
    required this.fboDetails,
  });

  final FBOSummary summary;
  final FBODetails fboDetails;
  @override
  Widget build(BuildContext context) {
    final isBDERoute = context.getCurrPath.contains('bdeRoutes');
    final isFboSummary = context.getCurrPath.contains('fboSummary');
    final showDownload = context.user.isBDE && isFboSummary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'FBO Summary',
              style: TextStyles.titleBold(context)
                  .copyWith(color: AppColors.black),
            ),
            if (showDownload) ...[
              BlocConsumer<DownloadFBOSummary, DownloadFBOSummaryState>(
                listener: (_, state) {
                  state.handle(
                    context,
                    success: (file) async {
                      final openResult = await OpenFilex.open(file.path);
                      if (!context.mounted) return;
                      switch (openResult.type) {
                        case ResultType.done:
                          context.showSnackbar(
                              openResult.message, AppSnackBarType.success);
                        case ResultType.fileNotFound ||
                              ResultType.noAppToOpen ||
                              ResultType.permissionDenied ||
                              ResultType.error:
                          context.showSnackbar(
                              openResult.message, AppSnackBarType.error);
                      }
                    },
                  );
                },
                builder: (_, state) {
                  if (state.isLoading) {
                    return const Center(child: LoadingIndicator());
                  }
                  return IconButton(
                    onPressed: () =>
                        context.cubit<DownloadFBOSummary>().request(summary),
                    icon: const Icon(Icons.download_outlined),
                  );
                },
              ),
            ],
          ],
        ),
        AppSpacer.p8(),
        Container(
          padding: const EdgeInsets.only(top: 6, right: 6, left: 6),
          decoration: BoxDecoration(
            color: AppColors.porcelianEarth,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SpacedColumn(
            defaultHeight: 12,
            children: [
              SummaryTileCard(
                  pading: const EdgeInsets.all(16),
                  child: showDownload
                      ? DataRow.withNil('Last no.of cans deposited',
                          summary.noOfCansSubmitted, "Kg's")
                      : DataRow.withNumericValue('Last no.of cans deposited',
                          summary.noOfCansSubmitted, "Kg's")),
              SummaryTileCard(
                pading: EdgeInsets.zero,
                child: SpacedColumn(
                  defaultHeight: 0,
                  divider: const Divider(
                    color: AppColors.green,
                    height: 0,
                    endIndent: 12,
                    indent: 12,
                  ),
                  children: [
                    SummaryTileCard(
                        child: showDownload
                            ? DataRow.withNil(
                                'Last Purchase Date', DFU.fromFrappeToddMMyyyy(summary.lastPurchaseDate))
                            : DataRow(
                                title: 'Last Purchase Date',
                                value: DFU.fromFrappeToddMMyyyy(summary.lastPurchaseDate))),
                    SummaryTileCard(
                        child: showDownload
                            ? DataRow.withNil(
                                'Last Purchase Rate',
                                NumUtils.nilOrValue(summary.lastPurchaseRate),
                                'INR')
                            : DataRow.withNumericValue('Last Purchase Rate',
                                summary.lastPurchaseRate, 'INR')),
                    SummaryTileCard(
                        child: showDownload
                            ? DataRow.withNil('Last Purchase Weight',
                                summary.lastPurcahseWeight, "Kg's")
                            : DataRow.withNumericValue('Last Purchase Weight',
                                summary.lastPurcahseWeight, "Kg's"))
                  ],
                ),
              ),
              SummaryTileCard(
                pading: const EdgeInsets.all(16),
                child: showDownload
                    ? DataRow.withNil(
                        'Dast of Cans Issued', summary.cansIssuedDate)
                    : DataRow(
                        title: 'Dast of Cans Issued',
                        value: summary.cansIssuedDate),
              ),
            ],
          ),
        ),
        if (context.user.isBDE) ...[
          AppButton(
            icon: const Icon(Icons.notifications, color: AppColors.white),
            bgColor: AppColors.liteRed,
            margin: const EdgeInsets.all(12),
            label: isBDERoute ? 'Send Remainder' : 'Remind',
            onPressed: () {
              if (isBDERoute) {
                showGeneralDialog(
                  context: context,
                  barrierLabel: 'SuccessDialog',
                  useRootNavigator: true,
                  barrierDismissible: true,
                  pageBuilder: (_, __, ___) => UserRoleSelection(
                    remaindDepot: () {
                      context.exit();
                      AppDialog.showSuccessDialog(
                        context,
                        content: 'Notification has been sent to the Depot',
                        onTapDismiss: context.exit,
                      );
                    },
                    remaindCE: () {
                      context.exit();
                      AppDialog.showSuccessDialog(
                        context,
                        content: 'Notification has been sent to the CE',
                        onTapDismiss: context.exit,
                      );
                    },
                  ),
                );
              } else {
                AppDialog.showSuccessDialog(
                  context,
                  content: 'Notification has been sent to FBO',
                  onTapDismiss: context.exit,
                );
              }
            },
          ),
        ] else ...[
          BlocConsumer<RemindFBOCubit, RemindFBOCubitState>(
            listener: (_, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data) => AppDialog.showSuccessDialog(
                  context,
                  content: 'A Notification has been send to the FBO.',
                  onTapDismiss: context.exit,
                ),
              );
            },
            builder: (_, state) => AppButton(
              isLoading: state.isLoading,
              icon: const Icon(Icons.notifications, color: AppColors.white),
              bgColor: AppColors.liteRed,
              margin: const EdgeInsets.all(12),
              label: 'Remind',
              onPressed: () =>
                  context.cubit<RemindFBOCubit>().request(summary.name),
            ),
          ),
        ],
        if (fboDetails.isEnrolled.isFalse) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Material(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0XFFF6F5F5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: AppColors.white),
                ),
                leading: const SizedBox(
                  height: double.infinity,
                  child: Icon(Icons.priority_high_outlined, color: Colors.red),
                ),
                titleTextStyle: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                title: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Unable to make a Purchase, Currently FBO Status is ',
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${fboDetails.remarks?.toUpperCase()}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ] else...[
              BlocBuilder<LocationDistanceCubit, LocationDistanceState>(
            builder: (_, state) {
            bool isFssaiValid = fboDetails.fssaiNumber?.isNotEmpty == true;

              if (state.isNotFailure && isFssaiValid) {
                return AppButton(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  label: 'NEXT',
                  // isLoading: state.isLoading,
                  onPressed: () async {
                    if (state.isWithInRange || state.isInitial) {
                      if(state.isInitial) {
                        await _updateGeoLocation(context);
                      }
                      if(!context.mounted) return;
                      final path = AppRoute.pickupEntry.path;
                      context.push(path, extra: {
                        'name' : fboDetails.name,
                        'latitude' : fboDetails.latitude,
                        'longitude' : fboDetails.longitude,
                      });
                    } else {
                      AppDialog.showErrorDialog(
                        context,
                        content: "You cannot make a purchase because you are ${state.distance} away from the FBO's location.Purchase will be allowed when you are within a 300-meter range.",
                        onTapDismiss: context.exit,
                      );
                    }
                  },
                );
              } 
              return const SizedBox.shrink();
            },
          ),

          ]
        
        ],
      // ],
    );
  }

  Future<void> _updateGeoLocation(BuildContext context) async {
    context.cubit<LocationDistanceCubit>().emitLoading();
    final position = await context.read<LocationDistanceCubit>().getCurrentLocation();
    final address = await LocationDistanceCubit.getAddressStr(position.latitude, position.longitude);
    final inp = GeoLocUpdate(
      name: fboDetails.name, 
      address: address, 
      latitude: position.latitude.toStringAsFixed(4), 
      longitude: position.longitude.toStringAsFixed(4),
    );
    await $sl.get<GeoLocaUpdateHelper>().call(inp);
    if(!context.mounted) return;
    context.cubit<LocationDistanceCubit>().clearLoading();
  }
}

class DataRow extends StatelessWidget {
  const DataRow({
    super.key,
    required this.title,
    required this.value,
    this.units,
  });

  final String title;
  final String? value;
  final String? units;

  static DataRow withNumericValue(String title, num? value, [String? units]) {
    return DataRow(title: title, value: _toStrValue(value), units: units);
  }

  static DataRow withNil(String title, dynamic value, [String? units]) {
    if (value is String?) {
      return DataRow(title: title, value: value.valueOrNil, units: units);
    }
    return DataRow(
        title: title, value: _toStrValue(value, '-Nil-'), units: units);
  }

  static String _toStrValue(num? value, [String defVal = '']) =>
      value.isNotNull ? value.toString() : defVal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyles.titleSmall(context),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value.valueOrEmpty,
                style: TextStyles.k14Bold(context),
              ),
              if (units.isNotNull) ...[
                AppSpacer.p12(),
                FittedBox(
                  child: Text(
                    'In $units',
                    style: TextStyles.k12Bold(context)
                        .copyWith(color: AppColors.green),
                  ),
                ),
              ] else ...[
                const SizedBox()
              ],
            ],
          ),
        ),
      ],
    );
  }
}



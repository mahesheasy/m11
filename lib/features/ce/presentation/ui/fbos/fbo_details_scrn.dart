import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/bloc/location_distance/location_distance_cubit.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_summary/fbo_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/fbos/widgets/fbo_summary_widget.dart';
import 'package:m11_ind/features/ce/presentation/widgets/fbo_details_card.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBODetailsScrn extends StatelessWidget {
  const FBODetailsScrn({super.key, required this.fboName});
  // final FBO form;
  final String fboName;
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'FBO',
      bgImagePath: AppIcons.pickUpBg.path,
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'FBO', value: fboName),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<FBODetailsCubit, FBODetailsCubitState>(
              builder: (_, state) {
                return state.maybeWhen(
                success: (fbo) => Column(
                  children: [
                  
                    FBODetailsCard(fbo: fbo),
                    AppSpacer.p8(),
                    BlocBuilder<FBOSummaryCubit, FBOSummaryCubitState>(
                      builder: (_, state) => state.maybeWhen(
                        success: (data) => BlocProvider(
                          create: (_) => LocationDistanceCubit()
                            ..getDistance(fbo.latitude, fbo.longitude),
                          child: FboSummaryWidget(
                            summary: data,
                            fboDetails: fbo,
                          ),
                        ),
                        failure: (failure) => AppFailureWidget(
                          message: failure.error,
                          onPress: () {
                            final detailsState =
                                context.read<FBODetailsCubit>().state;
                            final name = detailsState.maybeWhen(
                                orElse: () => null,
                                success: (data) => data.name);
                            if (name.isNotNull) {
                              context.cubit<FBOSummaryCubit>().request(name);
                            }
                          },
                        ),
                        loading: () => const Center(child: LoadingIndicator()),
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
                orElse: () => const Center(child: LoadingIndicator()),
                failure: (failure) => AppFailureWidget(message: failure.error),
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}

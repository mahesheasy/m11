import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/summary_tile.dart';
import 'package:m11_ind/features/ce/presentation/widgets/fbo_details_card.dart';
import 'package:m11_ind/features/fbo/models/request_extra_cans.dart';
import 'package:m11_ind/features/fbo/presentation/bloc/fbo_bloc_provider.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class RequestUCOPickUp extends StatefulWidget {
  const RequestUCOPickUp({super.key});

  @override
  State<RequestUCOPickUp> createState() => _RequestUCOFBOState();
}

class _RequestUCOFBOState extends State<RequestUCOPickUp> {
    double cans = 0;
  DateTime date = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Request UCO PickUp',
      headerWidget: const Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Request UCO PickUp'),
      ),
      child: SpacedColumn(
        mainAxisSize: MainAxisSize.min,
        defaultHeight: 12,
        children: [
          BlocBuilder<FBODetailsCubit, FBODetailsCubitState>(
            builder: (_, state) => state.maybeWhen(
              success: (data) => FBODetailsCard(fbo: data),
              orElse: () => const Center(child: LoadingIndicator()),
              failure: (failure) => AppFailureWidget(
                message: failure.error,
                onPress: () => context.cubit<FBODetailsCubit>().request(context.fboId),
              ),
            ),
          ),
          AppSpacer.p8(),
           SummaryListTile(
            title: 'No.of Cans For PickUp', 
            trailing: _CansCountController(
              decrement: () {
                if(cans == 1) return;
                setState(() {
                  cans--;
                });
              },
              increment: () {
                setState(() {
                  cans++;
                });
              },
              value: cans.toStringAsFixed(0),
            ),
          ),
          SummaryListTile(
            title: 'Select PickUp Date', 
            trailing: SummaryTrailBtn(
              child: Text(DFU.friendlyFormat(date), 
                style: TextStyles.labelLarge(context),
              ),
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context, 
                  firstDate: DateTime.now(), 
                  lastDate: DateTime.now().add(const Duration(days: 15)),
                );
                if(selectedDate.isNotNull) {
                  setState(() {
                    date = selectedDate!;
                  });
                }
              },
            ),
          ),
          BlocConsumer<RequestExtraCansCubit, RequestExtraCansCubitState>(
            listener: (context, state) {
              state.handle(context, 
                success: (data) => context.showSnackbar('PickUp Requested Successfully', AppSnackBarType.success),
              );
            },
            builder: (_, state) => AppButton(
              label: 'Submit',
              isLoading: state.isLoading,
              margin: const EdgeInsets.all(12.0),
              onPressed: () {
                if (cans == 0) {
                  context.showSnackbar('Cans cant be Zero', AppSnackBarType.info);
                } else {
                  final req = RequestExtraCans(
                    fboId: context.fboId,
                    noOfCans: cans.toInt(),
                    date: DFU.ddMMyyyy(date),
                  );
                  context.cubit<RequestExtraCansCubit>().request(req);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CansCountController extends StatelessWidget {
  const _CansCountController({required this.increment, required this.decrement, required this.value,});


  final VoidCallback increment;
  final VoidCallback decrement;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: decrement,
            child: const CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.grey,
              child: Icon(Icons.remove, size: 16, color: AppColors.white),
            ),
          ),
          AppSpacer.p8(),
          Text(value, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          AppSpacer.p8(),
          InkWell(
            onTap: increment,
            child: const CircleAvatar(
              maxRadius: 10,
              backgroundColor: AppColors.grey,
              child: Icon(Icons.add, size: 16, color: AppColors.white),
            ),
          ),
        ],
      );
  }
}



import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pickup_summary_builder.dart';
import 'package:m11_ind/features/ce/presentation/widgets/fbo_details_card.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/widgets/widgets.dart';

class PickUpRemarksScrn extends StatefulWidget {
  const PickUpRemarksScrn({super.key, required this.fbo});

  final FBODetails fbo;
  @override
  State<PickUpRemarksScrn> createState() => _PickUpRemarksScrnState();
}

class _PickUpRemarksScrnState extends State<PickUpRemarksScrn> {
  final TextEditingController otherRemarks = TextEditingController();
  String? remarks;
  String? scheduleDate;

  @override
  Widget build(BuildContext context) {
    final isOthers = StaticData.visitRemarks.last == remarks;
    return AppScaffoldWidget(
      title: 'Pick Up Remarks',
      bgImagePath: AppIcons.pickUpBg.path,
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'FBO', value: widget.fbo.name),
      ),
      child: SingleChildScrollView(
        child: SpacedColumn(
          children: [
            FBODetailsCard(fbo: widget.fbo),
            AppDropDown(
              title: 'Visit Remarks',
              isMandatory: true,
              items: StaticData.visitRemarks,
              defaultSelection: remarks,
              onSelected: (selectedItem) {
                setState(() {
                  remarks = selectedItem;
                });
              },
              headerBuilder: (_, selectedItem, __) => Text(selectedItem),
              listItemBuilder: (_, value, b, __) => Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            AppDateField(
              title: 'Schedule Date', 
              startDate: DFU.now(), 
              endDate: DFU.now().add(const Duration(days: 30)), 
              onSelected: (date) {
                scheduleDate = DFU.ddMMyyyy(date);
              },
            ),
            AppTextField(
              title: 'Description',
              hintText: 'Enter description',
              readOnly: false,
              isRequired: isOthers,
              controller: otherRemarks,
              maxLines: 6,
              minLines: 4,
            ),
           
            PickUpSummaryBuilder(
              builder: (state) => AppButton(
                isLoading: state.isLoading,
                onPressed: () {
                  final otherRemarksValue = otherRemarks.text;
                  if(remarks.isNull) {
                    context.showSnackbar('Select Visit Remarks', AppSnackBarType.error);
                    return;
                  } 
                  
                  if(isOthers && otherRemarksValue.trim().isEmpty) {
                    context.showSnackbar('Enter Other Remarks', AppSnackBarType.error);
                    return;
                  }
                  
                  context
                    .cubit<PickUpSummaryCubit>()
                    .updateRemarks(remarks!, otherRemarksValue, scheduleDate);
                },
                margin: const EdgeInsets.all(12.0),
                label: 'SUBMIT',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

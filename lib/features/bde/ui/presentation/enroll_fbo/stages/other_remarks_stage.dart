import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/buttons/app_btn.dart';

class OtherRemarksStage extends StatefulWidget {
  const OtherRemarksStage({super.key});

  @override
  State<OtherRemarksStage> createState() => _OtherRemarksStageState();
}

class _OtherRemarksStageState extends State<OtherRemarksStage> {
  String? _selectedRemarks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Please select an Option and follow to continue :', style: TextStyles.k14Bold(context)),
        ...StaticData.otherRemarks.map(
          (e) => CheckboxListTile(
            value: _selectedRemarks == e,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.green,
            checkboxShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(e, style: const TextStyle(fontWeight: FontWeight.bold)),
            onChanged: (value) {
              setState(() {
                _selectedRemarks = e;
              });
              context.cubit<EnrollFboCubit>().onFieldChange(otherRemarks: e);
            },
          ),
        ),
        AppButton(
          label: 'SUBMIT',
          margin: const EdgeInsets.all(12.0),
          onPressed: _selectedRemarks.isNull
              ? null
              : context.cubit<EnrollFboCubit>().nextStep,
        ),
      ],
    );
  }
}

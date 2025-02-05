import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class RemarksStage extends StatefulWidget {
  const RemarksStage({super.key});

  @override
  State<RemarksStage> createState() => _RemarksStageState();
}

class _RemarksStageState extends State<RemarksStage> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return EnrollFBOBlocBuilder(
      buildWhen: (prev, curr) => curr.form.remarks != prev.form.remarks,
      builder: (_, state) {
        _selectedOption = state.form.remarks;
        return Column(
        children: [
          Text('Please select an Option and follow to continue :', style: TextStyles.k14Bold(context)),
          ...StaticData.enrollRemarks.map(
            (e) => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: state.form.remarks == e.id,
              activeColor: AppColors.green,
              checkboxShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              onChanged: (value) {
                setState(() {
                  _selectedOption = e.id;
                });
                context.cubit<EnrollFboCubit>().onUpdateRemarks(e.id);
              },
            ),
          ),
          AppButton(
            label: 'SUBMIT',
            margin: const EdgeInsets.all(12.0),
            onPressed: _selectedOption.isNull
                ? null
                : () {
                  final nextStage = context.read<EnrollFboCubit>().state.finishedStage;
                  context.cubit<EnrollFboCubit>().nextStep(nextStage);
                }
          ),
        ],
      );
      },
    );
  }
}

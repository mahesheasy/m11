import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FollowUpStage extends StatelessWidget {
  const FollowUpStage({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.cubit<EnrollFboCubit>().state.form;
    final date = form.followupDate;
    return Column(
      children: [
        AppDateField(
          title: 'Follow Up Date', 
          initialDate: date,
          startDate: DateTime.now(), 
          suffixIcon: const Icon(Icons.event, color: AppColors.green),
          isRequired: true,
          endDate: DateTime.now().add(const Duration(days: 30)), 
          onSelected: (date) {
            final formattedDate = DFU.ddMMyyyy(date);
            context.cubit<EnrollFboCubit>().onFieldChange(followDate: formattedDate);
          },
        ),
        AppButton(
          label: 'SUBMIT',
          margin: const EdgeInsets.all(12.0),
          onPressed: context.cubit<EnrollFboCubit>().nextStep,
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m11_ind/app/model/otp_request_type.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';
import 'package:m11_ind/features/commons/widgets/otp_verf_dialog.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UCOCollectionDate extends StatelessWidget {
  const UCOCollectionDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDateField(
          title: 'UCO Collection Date',
          isRequired: true,
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 30)),
          onSelected: (date) {
            final formattedDate = DFU.ddMMyyyy(date);
            context
                .cubit<EnrollFboCubit>()
                .onFieldChange(ucoDate: formattedDate);
          },
        ),
        AppSpacer.p12(),
        AppTimeField(
          title: 'UCO Collection Time',
          isRequired: true,
          onSelected: (newTime) {
            final formatter = NumberFormat('00');
            final timeFormat =
                '${formatter.format(newTime.hour)}:${formatter.format(newTime.minute)}:${formatter.format(newTime.hourOfPeriod)}';
            context.cubit<EnrollFboCubit>().onFieldChange(ucoTime: timeFormat);
          },
        ),
        EnrollFBOBlocBuilder(
          builder: (_, state) => AppButton(
            label: 'NEXT',
            margin: const EdgeInsets.all(12.0),
            onPressed: (state.form.ucoCollectionDate.isNull ||
                    state.form.ucoCollectionTime.isNull)
                ? null
                : () {
                  if(state.form.isEnrolling.isTrue) {
                    print('Enrolling is true');
                    _promptOTP(state.form.mobileNumber!, context);
                  } else {
                    context.cubit<EnrollFboCubit>().nextStep();
                  }
                },
          ),
        ),
      ],
    );
  }

  void _promptOTP(String mobileNumber, BuildContext context) async {
    final isVerified = await OTPVerfDialog.launchOTPVerfDialog(
      context,
      mobileNumber: mobileNumber,
      type: OTPRequestType.enroll,
      onPop: context.close,
    );
    if(isVerified && context.mounted) {
      context.cubit<EnrollFboCubit>()..nextStep()..complete();
    }
  }

}

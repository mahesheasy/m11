import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UploadFBOPhoto extends StatelessWidget {
  const UploadFBOPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EnrollFBOBlocBuilder(
          builder: (context, state) {
            return UploadPhotoWidget(
              imageUrl: state.form.photoUrl,
              defaultValue: state.form.photo,
              onFileCapture: context.cubit<EnrollFboCubit>().uploadPhoto
            );
          },
          
        ),
        AppButton(
          label: 'NEXT',
          margin: const EdgeInsets.all(12.0),
          onPressed: () {
            final enrollForm = context.read<EnrollFboCubit>().state.form;
            final photo = enrollForm.photo;
            final photoUrl = enrollForm.photoUrl;
            if(photo.isNull && photoUrl.doesNotHaveValue) {
              context.cubit<EnrollFboCubit>().emitError("Upload FBO's Photo");
            } else {
              context.cubit<EnrollFboCubit>().nextStep();
            }
          },
        ),
      ],
    );
  }
}
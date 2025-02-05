import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';

class EnrollFBOBlocBuilder extends StatelessWidget {
  const EnrollFBOBlocBuilder({
    super.key,
    this.buildWhen,
    required this.builder,
  });

  final BlocBuilderCondition<EnrollFboState>? buildWhen;
  final BlocWidgetBuilder<EnrollFboState> builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnrollFboCubit, EnrollFboState>(
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}

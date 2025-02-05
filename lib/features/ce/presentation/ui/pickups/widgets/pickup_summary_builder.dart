import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';

class PickUpSummaryBuilder extends StatelessWidget {
  const PickUpSummaryBuilder({
    super.key,
    required this.builder,
    this.buildWhen,
    this.listener,
  });

  final WidgetBlocBuilder<PickUpSummaryState> builder;
  final BlocBuilderCondition<PickUpSummaryState>? buildWhen;
  final void Function(PickUpSummaryState state)? listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickUpSummaryCubit, PickUpSummaryState>(
      listener: (context, state) {
        listener.isNotNull ? listener!(state) : null;
      },
      buildWhen: buildWhen,
      builder: (_, state) => builder(state),
    );
  }
}

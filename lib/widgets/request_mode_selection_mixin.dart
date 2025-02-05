import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/buttons/app_btn.dart';
import 'package:m11_ind/widgets/spaced_column.dart';

mixin RequestModeSelectionMixin {
  Future<String?> showOptions(
    BuildContext context, {
    String? defaultValue,
  }) async {
    return await showModalBottomSheet<String?>(
      backgroundColor: Colors.white.withOpacity(0.0),
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.cubit<RequestModeCubit>(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppColors.white,
              ),
              child: SpacedColumn(
                margin: const EdgeInsets.all(12.0),
                divider: const Divider(color: AppColors.grey),
                children: [
                  BlocBuilder<RequestModeCubit, RequestModeCubitState>(
                    builder: (_, state) {
                      final modes = state.maybeWhen(
                          orElse: () => <RequestMode>[],
                          success: (data) => data);
                      return SpacedColumn(
                        divider: const Divider(
                          height: 1,
                        ),
                        children: modes
                            .map(
                              (e) => _CompactListTile(
                                mode: e,
                                value: defaultValue,
                                onTap: () => context.pop(e.id),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.white.withOpacity(0.0),
            ),
            AppButton(
              bgColor: AppColors.white,
              margin: const EdgeInsets.all(12.0),
              onPressed: context.pop,
              textStyle: TextStyles.btnTextStyle(context)
                  .copyWith(color: AppColors.red),
              label: 'CLOSE',
            ),
          ],
        ),
      ),
    );
  }
}

class _CompactListTile extends StatelessWidget {
  const _CompactListTile({this.onTap, required this.mode, required this.value});

  final RequestMode mode;
  final VoidCallback? onTap;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value == mode.id,
      onChanged: (value) => onTap?.call(),
      checkColor: AppColors.white,
      visualDensity: const VisualDensity(vertical: -3),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.green,
      checkboxShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mode.name,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.green, 
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            mode.count.toString(),
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.black, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

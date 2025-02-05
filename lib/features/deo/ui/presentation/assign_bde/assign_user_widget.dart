import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/widgets/fbo_details_card.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/widgets/widgets.dart';

enum AssigningRole { bde, ce }

class AssignUserScrn extends StatelessWidget {
  const AssignUserScrn({super.key, required this.fboId, required this.role});

  final String fboId;
  final AssigningRole role;
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Assign BDE',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: BlocBuilder<FBODetailsCubit, FBODetailsCubitState>(
          builder: (_, state) {
            return state.maybeWhen(
              success: (data) => PageHeaderWidget(title: 'FBO', value: data.businessName),
              orElse: () => const Positioned(child: SizedBox.shrink()),
            );
          },
        ),
      ),
      child: BlocBuilder<FBODetailsCubit, FBODetailsCubitState>(
        builder: (_, state) => state.maybeWhen(
          initial: () => const SizedBox.shrink(),
          success: (data) => SingleChildScrollView(
            child: SpacedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              defaultHeight: 12,
              children: [
                FBODetailsCard(fbo: data),
                if (role == AssigningRole.ce) ...[
                  BlocProvider(
                    create: (_) => DEOBlocProvider.get().assignCE(),
                    child: _AssignCEForm(fboId: data.name),
                  ),
                ],
                if (role == AssigningRole.bde) ...[
                  BlocProvider(
                    create: (_) => DEOBlocProvider.get().assignBDE(),
                    child: _AssignBDEForm(fboId: data.name),
                  ),
                ],
              ],
            ),
          ),
          orElse: () => const Center(child: LoadingIndicator()),
        ),
      ),
    );
  }
}

class _AssignCEForm extends StatefulWidget {
  const _AssignCEForm({required this.fboId});

  final String fboId;
  @override
  State<_AssignCEForm> createState() => _AssignCEFormState();
}

class _AssignCEFormState extends State<_AssignCEForm> {
  String? selctedCE;

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      defaultHeight: 12.0,
      children: [
        BlocBuilder<CEUsers, CEUsersState>(
          builder: (_, state) {
            final details = state.maybeWhen(
                orElse: () => <String>[], success: (data) => data);
            return AppDropDown(
              title: 'CE Name :',
              items: details,
              hint: 'Select Collection Executive',
              headerBuilder: (c, selectedItem, _) => SelectedItemBuilder(selectedItem),
              onSelected: (ce) {
                setState(() => selctedCE = ce);
              },
              listItemBuilder: (_, value, b, __) => SelectedItemBuilder(value),
            );
          },
        ),
        
        BlocConsumer<AssignCE, AssignCEState>(
          listener: (_, state) {
            state.handle(
              context,
              success: (data) => AppDialog.showSuccessDialog(
                context,
                content: 'Assigned CE successfully.',
                onTapDismiss: context.exit,
              ).then((_) => context.close(true)),
            );
          },
          builder: (_, state) => AppButton(
            label: 'ASSIGN CE',
            isLoading: state.isLoading,
            onPressed: () {
              if (selctedCE.isNull) {
                context.showSnackbar(
                    'Select Collection Executive', AppSnackBarType.info);
                return;
              }
              context
                  .cubit<AssignCE>()
                  .request(Pair(widget.fboId, selctedCE!));
            },
          ),
        )
      ],
    );
  }
}

class _AssignBDEForm extends StatefulWidget {
  const _AssignBDEForm({required this.fboId});

  final String fboId;
  @override
  State<_AssignBDEForm> createState() => _AssignBDEFormState();
}

class _AssignBDEFormState extends State<_AssignBDEForm> {
  String? selctedCE;

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      defaultHeight: 12.0,
      children: [
        BlocBuilder<BDEUsers, BDEUsersState>(
          builder: (_, state) {
            final details = state.maybeWhen(
                orElse: () => <String>[], success: (data) => data);
            return AppDropDown(
              title: 'BDE :',
              items: details,
              hint: 'Select BDE',
              headerBuilder: (c, selectedItem, _) => SelectedItemBuilder(selectedItem),
              onSelected: (ce) {
                setState(() => selctedCE = ce);
              },
              listItemBuilder: (_, value, b, __) => SelectedItemBuilder(value),
            );
          },
        ),
        BlocConsumer<AssignBDE, AssignBDEState>(
          listener: (_, state) {
            state.handle(
              context,
              success: (data) => AppDialog.showSuccessDialog(
                context,
                content: 'Assigned CE successfully.',
                onTapDismiss: context.exit,
              ).then((_) => context.close(true)),
            );
          },
          builder: (_, state) => AppButton(
            label: 'ASSIGN BDE',
            isLoading: state.isLoading,
            onPressed: () {
              if (selctedCE.isNull) {
                context.showSnackbar('Select BDE', AppSnackBarType.info);
                return;
              }
              context
                  .cubit<AssignBDE>()
                  .request(Pair(widget.fboId, selctedCE!));
            },
          ),
        )
      ],
    );
  }
}

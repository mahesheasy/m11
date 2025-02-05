import 'package:flutter/material.dart' hide DataRow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/ui/fbos/widgets/fbo_summary_widget.dart';
import 'package:m11_ind/features/deo/model/uco_deposit.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/deo/ui/presentation/uco_deposit/widget/uco_deposit_scrn.dart';
import 'package:m11_ind/features/deo/ui/presentation/uco_deposit/widget/uco_deposit_widget.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/empty_data_widget.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UCOCollections extends StatefulWidget {
  const UCOCollections({super.key});

  @override
  State<UCOCollections> createState() => _UCOCollectionsState();
}

class _UCOCollectionsState extends State<UCOCollections> {
  String? selmaster;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appbar: Text('UCO Deposit', style: TextStyles.appbarTextstyle(context)),
      headerWidget: const SizedBox(),
      child: SpacedColumn(
        defaultHeight: 12.0,
        children: [
          BlocBuilder<DriverList,  NetworkRequestState<List<String>>>(
            builder: (_, state) {
              final details = state.maybeWhen(
                orElse: () => <String>[],
                success: (data) => data,
              );
              return SearchDropDownList(
                title: 'CE / Vehicle Number :',
                hint: 'Select Collection Executive',
                items: details, 
                isMandatory: true,
                headerBuilder: (c, selectedItem, _) =>  Text(selectedItem),
                defaultSelection: selmaster,
                listItemBuilder: (_, value, b, __) => Text(value),
                futureRequest: (p0) async {
                  final whereList = details.where((e) 
                    => e.containsIgnoreCase(p0)
                    || e.containsIgnoreCase(p0),
                  );
                  return whereList.toList();
                },
                onSelected: (item) {
                  if (item.isNull) return;
                  selmaster = item;
                  context.cubit<UCODepositCubit>().request(item!);
                },
              );
            },
          ),
          Expanded(
            child: BlocBuilder<UCODepositCubit, UCODepositState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: LoadingIndicator()),
                  failure: (failure) => AppFailureWidget(message: failure.error),
                  success: (deposits) {
                    if (deposits.isEmpty) {
                      return Center(
                        child: EmptyDataWidget(emptyText: 'No Collections Found for $selmaster'),
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          _SummaryCard(deposits),
                          AppSpacer.p8(),
                          ListView.separated(
                            separatorBuilder: (context, _)=> AppSpacer.p8(),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: deposits.length,
                             itemBuilder: (context, index) {
                              final coll = deposits[index];
                              return UCODepositWidget(deposit: coll);
                          },
                          ),
                          AppSpacer.p8(),
                          AppButton(
                            label: 'Deposit',
                            onPressed: () async {
                              final isSubmitted = await context.goToPage<bool?>(MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(value: BlocProvider.of<UCODepositCubit>(context)),
                                  BlocProvider(create: (_) => DEOBlocProvider.get().ucoSubmission()),
                                ],
                                child: UCODepositScrn(master: selmaster!)),
                              );
                              if(isSubmitted.isTrue && context.mounted && selmaster.isNotNull) {
                                context.cubit<UCODepositCubit>().request(selmaster!);
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard(this.deposits);

  final List<UCODeposit> deposits;
  @override
  Widget build(BuildContext context) {
    final totalCollQty = deposits.fold(0.0, (p, e) => p + e.collQty).truncateToDouble();
    final totalCans = deposits.fold(0, (p, e) => p + e.noOfCans.toInt());
    final totalAmount = deposits.fold(0, (p, e) => p + e.totalAmt.toInt());
    return Container(
      decoration: BoxDecoration(
        color: AppColors.chlorophyll,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: DefaultTextStyle(
        style: context.textTheme.titleSmall!,
        child: SpacedColumn(
          margin: const EdgeInsets.all(8.0),
          children: [
            DataRow(title: 'Total Coll Qty :', value: '$totalCollQty In kgs'),
            DataRow(title: 'Total Cans :', value: totalCans.toString()),
           DataRow(title: 'Total Amount :', value: totalAmount.toString()),

          ],
        ),
      ),
    );
  }
}

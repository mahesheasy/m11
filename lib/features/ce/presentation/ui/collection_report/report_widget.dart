import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/collection_report.dart';
import 'package:m11_ind/features/ce/presentation/bloc/collection_report/collection_report_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/download_report/download_repo_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/empty_data_widget.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:open_filex/open_filex.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionReportCubit, CollectionReportState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const LoadingIndicator(),
          success: (data) => DefaultTabController(
            length: 2,
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${data.length} Collections'),
                      BlocBuilder<DateFilterCubit, DateFilter>(
                        builder: (_, state) => ListTile(
                          titleTextStyle: TextStyles.titleBold(context, size: 14),
                          subtitleTextStyle: TextStyles.titleBold(context, size: 14),
                          contentPadding: EdgeInsets.zero,
                          title: Text(DFU.getDayNameFully(state.activeDay)),
                          subtitle: Text(DFU.ddMMMyyyy(state.activeDay)),
                          trailing: BlocConsumer<DownloadReportCubit, DownloadReportState>(
                            listener: (_, state) {
                              state.maybeWhen(
                                orElse: () {},
                                success: (file) async {
                                  final openResult = await OpenFilex.open(file.path);
                                  if(!context.mounted) return;
                                  switch(openResult.type) {
                                    case ResultType.done: context.showSnackbar(openResult.message, AppSnackBarType.success);
                                    case ResultType.fileNotFound || ResultType.noAppToOpen || ResultType.permissionDenied ||
                                    ResultType.error: context.showSnackbar(openResult.message, AppSnackBarType.error);
                                  }
                                },
                              );
                            },
                            builder: (_, state) {
                              if(state.isLoading) {
                                return CircularProgressIndicator(
                                  color: context.colorScheme.primary,
                                  strokeWidth: 3,
                                );
                              }

                              return IconButton(
                                onPressed: () {
                                  context
                                      .cubit<DownloadReportCubit>()
                                      .request(data);
                                },
                                icon: const Icon(Icons.download_outlined),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        color: AppColors.green,
                        child: TabBar(
                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.white.withOpacity(.8),
                          labelStyle: TextStyles.titleBold(context),
                          indicatorColor: AppColors.white,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const [
                            Tab(child: Text('Summary')),
                            Tab(child: Text('Detailed')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _SummaryReport(data: data),
                        _DetailedReport(data: data),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SummaryReport extends StatelessWidget {
  const _SummaryReport({required this.data});

  final List<CollectionReport> data;

  @override
  Widget build(BuildContext context) {
    final totalWeight = data.fold(0.0, (pv, e) => pv + e.ucoWeight);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: context.sizeOfWidth,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.green, width: 1),
          ),
          alignment: Alignment.center,
          child: Text('UCO Weight', style: TextStyles.titleBold(context)),
        ),
        Container(
          width: context.sizeOfWidth,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.green, width: 1),
          ),
          alignment: Alignment.center,
          child: Text('$totalWeight (In Kgs)', style: TextStyles.titleBold(context)),
        ),
      ],
    );
  }
}

class _DetailedReport extends StatelessWidget {
  const _DetailedReport({required this.data});

  final List<CollectionReport> data;

  @override
  Widget build(BuildContext context) {
    if(data.isEmpty) {
      return const EmptyDataWidget(emptyText: 'No Data Found');
    }
    return ListView(
      children: [
        DataTable(
          border: TableBorder.all(color: AppColors.green, width: 2),
          headingRowColor: WidgetStateColor.resolveWith((_) => AppColors.green),
          headingTextStyle: context.textTheme.titleMedium
              ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          columns: const [
            DataColumn(label: Text('FBO Name')),
            DataColumn(
              label: Flexible(child: Text("UCO Weight\n(In Kg's)",  textAlign: TextAlign.center)),
            ),
          ],
          rows: data.map(
            (e) => DataRow(
              cells: [
                DataCell(Center(child: Text(e.supplierName, style: TextStyles.titleBold(context)))),
                DataCell(Center(child: Text(e.ucoWeight.toStringAsFixed(2), style: TextStyles.titleBold(context).copyWith(color: AppColors.black)))),
              ],
            ),
          ).toList(),
        ),
      ],
    );
  }
}

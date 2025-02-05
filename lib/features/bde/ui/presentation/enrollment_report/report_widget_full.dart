import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/enrollment_report.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/bde/ui/bloc/download_report/download_repo_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/empty_data_widget.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:open_filex/open_filex.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnrollmentReportCubit, EnrollmentReportCubitState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const LoadingIndicator(),
          failure: (failure) => AppFailureWidget(
            message: failure.error,
            onPress: context.cubit<EnrollmentReportCubit>().request,
          ),
          success: (data) {
            final startDate = DFU.friendlyFormat(DateTime(DFU.now().year, DFU.now().month));
            final endDate = DFU.friendlyFormat(DFU.now());

            return DefaultTabController(
            length: 2,
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                        titleTextStyle: TextStyles.labelMedium(context),
                        subtitleTextStyle: TextStyles.titleBold(context),
                        title: Text('${data.length} Enrollments'),
                        subtitle: Text('$startDate - $endDate'),
                        trailing: BlocConsumer<DownloadEnrollReportCubit, DownloadReportState>(
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
                                      .cubit<DownloadEnrollReportCubit>()
                                      .request(data);
                                },
                                icon: const Icon(Icons.download_outlined),
                              );
                            },
                          ),
                      ),
                      
                      Container(
                        color: AppColors.green,
                        child: TabBar(
                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.white.withOpacity(.8),
                          labelStyle: TextStyles.labelMedium(context),
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
          );
          },
        );
      },
    );
  }
}

class _SummaryReport extends StatelessWidget {
  const _SummaryReport({required this.data});

  final List<EnrollmentReport> data;

  @override
  Widget build(BuildContext context) {

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
          child: Text('Number Of FBOs', style: TextStyles.titleBold(context)),
        ),
        Container(
          width: context.sizeOfWidth,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.green, width: 1),
          ),
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: '${data.length}',
              style: TextStyles.titleBold(context).copyWith(color: AppColors.black),
              children: [
                TextSpan(text: '    (This Month)',style: TextStyles.titleBold(context))
              ],
            ),
          ),
        ),
        // Text('${data.length}', style: TextStyles.titleBold(context))
      ],
    );
  }
}

class _DetailedReport extends StatelessWidget {
  const _DetailedReport({required this.data});

  final List<EnrollmentReport> data;

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
              label: Flexible(child: Text("UCO Rate\n(In Kg's)",  textAlign: TextAlign.center)),
            ),
          ],
          rows: data.map(
            (e) => DataRow(
              cells: [
                DataCell(Center(child: Text(e.fboname, style: TextStyles.titleBold(context)))),
                DataCell(Center(child: Text(e.ucorate.toStringAsFixed(2), style: TextStyles.titleBold(context).copyWith(color: AppColors.black)))),
              ],
            ),
          ).toList(),
        ),
      ],
    );
  }
}
